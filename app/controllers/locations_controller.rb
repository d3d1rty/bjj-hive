# frozen_string_literal: true

##
# = LocationsController
# Author::    Richard Davis
#
# This controller provides methods for locations business logic.
class LocationsController < ApplicationController
  before_action :require_login
  before_action :protect_user_resources
  before_action :verify_organizer
  before_action :verify_registration_complete, except: :create
  before_action :set_user
  before_action :set_location, only: %i[show edit update destroy]

  ##
  # GET /users/:user_id/locations
  def index
    @locations = @user.locations.all
  end

  ##
  # GET /users/:user_id/locations/new
  def new
    @location = @user.locations.new
  end

  ##
  # GET /users/:user_id/locations/1/edit
  def edit; end

  ##
  # POST /users/:user_id/locations
  def create
    @location = @user.locations.create(location_params)

    if @location.save
      track('Location Creation Success', @location.attributes)
      redirect_to user_locations_path(@user), notice: I18n.t('notices.location.create')
    else
      track('Location Creation Failure', @location.errors.messages)
      flash.now[:alert] = @location.errors.full_messages
      return render 'users/location_prompt' unless current_user.created_first_location?

      render :new
    end
  end

  ##
  # PATCH/PUT /users/:user_id/locations/:location_id
  def update
    if @location.update(location_params)
      track('Location Update Success', location_params)
      redirect_to user_locations_path(@user), notice: I18n.t('notices.location.update')
    else
      track('Location Update Failure', @location.errors.messages)
      flash.now[:alert] = @location.errors.full_messages
      render :edit
    end
  end

  ##
  # DELETE /users/:user_id/locations/:location_id
  def destroy
    if @location.destroy
      track('Location Destruction Success', id: @location.id)
      redirect_to user_locations_path(@user), notice: I18n.t('notices.location.destroy')
    else
      track('Location Destruction Failure', @location.errors.messages)
      redirect_to user_locations_path(@user), @location.errors.full_messages
    end
  end

  private

  ##
  # Set location for controller actions.
  def set_location
    @location = Location.find(params[:id])
  end

  ##
  # Filter parameters.
  def location_params
    params.require(:location).permit(:name, :street_address, :city, :state, :zip, :country, :user_id)
  end
end
