# frozen_string_literal: true

##
# = RepliesController
# Author::    Richard Davis
#
# This controller provides methods for replies business logic.
class RepliesController < ApplicationController
  before_action :require_login
  before_action :set_reply, except: :create
  before_action :set_post
  before_action :protect_user_resources, except: :create
  before_action :verify_registration_complete

  ##
  # GET /posts/:post_slug/replies/:reply_id/edit
  def edit; end

  ##
  # POST /posts/:post_slug/replies
  def create
    @reply = @post.replies.create(reply_params)

    if @reply.save
      track('Reply Creation Success', @reply.attributes)
      flash[:notice] = I18n.t('notices.reply.create')
    else
      track('Reply Creation Failure', @reply.errors.messages)
      flash[:alert] = @reply.errors.full_messages
    end

    redirect_to post_path(@post)
  end

  ##
  # PATCH/PUT /posts/:post_slug/replies/:reply_id/edit
  def update
    if @reply.update(reply_params)
      track('Reply Update Success', reply_params)
      flash[:notice] = I18n.t('notices.reply.update')
    else
      track('Reply Update Failure', @reply.errors.messages)
      flash[:alert] = @reply.errors.full_messages
    end

    redirect_to post_path(@post)
  end

  ##
  # DELETE /posts/:post_slug/replies/:reply_id
  def destroy
    if @reply.destroy
      track('Reply Destruction Success', id: @reply.id)
      redirect_to post_path(@post), notice: I18n.t('notices.reply.destroy')
    else
      track('Reply Destruction Failure', @reply.errors.messages)
      redirect_to post_path(@post), alert: @reply.errors.full_messages
    end
  end

  private

  ##
  # Sets reply for individual resource actions.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  ##
  # Sets post for individual resource actions.
  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  ##
  # Protect user resources.
  def protect_user_resources
    return if current_user.id == @reply.user.id

    track('Unauthorized Access Attempt', user_id: current_user.id, url: request.fullpath)
    redirect_back fallback_location: root_path, alert: [I18n.t('alerts.unauthorized')]
  end

  ##
  # Filter parameters.
  def reply_params
    params.require(:reply).permit(%i[body post_id user_id])
  end
end
