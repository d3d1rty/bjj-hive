# frozen_string_literal: true

##
# = PostsController
# Author::    Richard Davis
#
# This controller provides methods for posts business logic.
class PostsController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :set_user, only: %i[new edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :protect_user_resources, only: %i[edit update destroy]
  before_action :verify_registration_complete, except: %i[index show]

  ##
  # GET /posts
  def index
    @posts = Post.all
  end

  ##
  # GET /posts/:event_slug
  def show; end

  ##
  # GET /users/:user_id/posts/new
  def new
    @post = @user.posts.new
  end

  ##
  # GET /users/:user_id/posts/:post_slug/edit
  def edit; end

  ##
  # POST /users/:user_id/posts
  def create
    @post = @user.posts.create(post_params)

    if @post.save
      track('Post Creation Success', @post.attributes)
      redirect_to post_path(@post), notice: I18n.t('notices.post.create')
    else
      track('Post Creation Failure', @post.errors.messages)
      flash.now[:alert] = @post.errors.full_messages
      render :new
    end
  end

  ##
  # PATCH/PUT /users/:user_id/posts/:post_id
  def update
    if @post.update(post_params)
      track('Post Update Success', post_params)
      redirect_to post_path(@post), notice: I18n.t('notices.post.update')
    else
      track('Post Update Failure', @post.errors.messages)
      flash.now[:alert] = @post.errors.full_messages
      render :edit
    end
  end

  ##
  # DELETE /users/:user_id/posts/:post_id
  def destroy
    if @post.destroy
      track('Post Destruction Success', id: @post.id)
      redirect_to posts_path, notice: I18n.t('notices.post.destroy')
    else
      track('Post Destruction Failure', @post.errors.messages)
      redirect_to post_path(@post), alert: @post.errors.full_messages
    end
  end

  private

  ##
  # Sets the post for the controller action.
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  ##
  # Filter parameters.
  def post_params
    params.require(:post).permit(:subject, :body, :user_id)
  end
end
