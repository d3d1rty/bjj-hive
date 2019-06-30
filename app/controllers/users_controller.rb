# frozen_string_literal: true

##
# = UsersController
# Author::    Richard Davis
#
# This controller provides methods for user sign up and settings.
class UsersController < Clearance::UsersController
  before_action :set_user, only: %i[show edit settings location_prompt organizer_prompt update destroy]
  before_action :protect_user_resources, only: %i[edit settings location_prompt organizer_prompt update destroy]
  before_action :verify_organizer, only: :location_prompt
  before_action :verify_registration_complete, except: %i[new create update location_prompt organizer_prompt]

  ##
  # GET /users/new
  def new
    @user = User.new
  end

  ##
  # GET /users/:user_id
  def show; end

  ##
  # GET /users/:user_id/edit
  def edit; end

  ##
  # GET /users/:user_id/settings
  def settings; end

  ##
  # GET /users/:user_id/location
  def location_prompt
    @location = @user.locations.new
  end

  ##
  # GET /users/:user_id/organizer
  def organizer_prompt; end

  ##
  # POST /users
  def create
    @user = User.create(user_params)

    if @user.save
      track('User Signup Success', first_name: @user.first_name, last_name: @user.last_name, handle: @user.handle, email: @user.email)
      sign_in @user
      redirect_to url_after_create, notice: I18n.t('notices.user.create')
    else
      track('User Signup Failure', @user.errors.messages)
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  ##
  # PATCH/PUT /users/:user_id
  def update
    if @user.update(user_params)
      track('User Update Success', user_params)
      return redirect_to location_prompt_path(@user) unless @user.created_first_location?

      redirect_to user_settings_path(@user), notice: I18n.t('notices.user.update')
    else
      track('User Update Failure', @user.errors.messages)
      redirect_to edit_user_path, alert: @user.errors.full_messages
    end
  end

  private

  ##
  # Set user for controller actions.
  def set_user
    @user = User.find(params[:id])
  end

  ##
  # Override default behavior from clearance.
  def user_from_params
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    handle = user_params.delete(:handle)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.handle = handle
      user.email = email
      user.password = password
    end
  end

  ##
  # Override default behavior from clearance.
  def url_after_create
    organizer_prompt_path(current_user)
  end

  ##
  # Filter parameters.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :handle, :email, :password, :organizer)
  end
end
