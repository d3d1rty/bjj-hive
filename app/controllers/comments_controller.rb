# frozen_string_literal: true

##
# = CommentsController
# Author::    Richard Davis
#
# This controller provides methods for comments business logic.
class CommentsController < ApplicationController
  before_action :require_login
  before_action :set_event
  before_action :set_comment, except: :create
  before_action :protect_user_resources, except: :create
  before_action :verify_registration_complete

  ##
  # GET /events/:event_slug/comments/:comment_id/edit
  def edit; end

  ##
  # POST /events/:event_slug/comments
  def create
    @comment = @event.comments.new
    @comment.body = comment_params[:body]
    @comment.user_id = current_user.id
    @comment.parent = Comment.find(comment_params[:parent_id]) if parent_id_valid?

    if @comment.save
      track('Comment Creation Success', @comment.attributes)
      flash[:notice] = I18n.t('notices.comment.create')
    else
      track('Comment Creation Failure', @comment.errors.messages)
      flash[:alert] = @comment.errors.full_messages
    end

    redirect_to event_path(@event)
  end

  ##
  # PATCH/PUT /events/:event_slug/comments/:comment_id/edit
  def update
    if @comment.update(comment_params)
      track('Comment Update Success', comment_params)
      flash[:notice] = I18n.t('notices.comment.update')
    else
      track('Comment Update Failure', @comment.errors.messages)
      flash[:alert] = @comment.errors.full_messages
    end

    redirect_to event_path(@event)
  end

  ##
  # DELETE /events/:event_slug/comments/:comment_id
  def destroy
    if @comment.destroy
      track('Comment Destruction Success', id: @comment.id)
      redirect_to event_path(@event), notice: I18n.t('notices.comment.destroy')
    else
      track('Comment Destruction Failure', @comment.errors.messages)
      redirect_to event_path(@event), alert: @comment.errors.full_messages
    end
  end

  private

  ##
  # Sets comment for individual resource actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  ##
  # Sets event for individual resource actions.
  def set_event
    @event = Event.friendly.find(params[:event_id])
  end

  def parent_id_valid?
    (comment_ids.include?(comment_params[:parent_id].to_i)) ? true : false
  end

  def comment_ids
    comment_ids = []
    @event.comments.all.each do |comment|
      comment_ids.push(comment.id)
    end
    comment_ids
  end

  ##
  # Protect user resources.
  def protect_user_resources
    return if current_user.id == @comment.user.id

    track('Unauthorized Access Attempt', user_id: current_user.id, url: request.fullpath)
    redirect_back fallback_location: root_path, alert: [I18n.t('alerts.unauthorized')]
  end

  ##
  # Filter parameters.
  def comment_params
    params.require(:comment).permit(%i[body parent_id event_id user_id])
  end
end
