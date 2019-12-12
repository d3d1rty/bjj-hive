# frozen_string_literal: true

##
# = EventsController
# Author::    Richard Davis
#
# This controller provides methods for events business logic.
class EventsController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :set_user, only: %i[new edit create update destroy]
  before_action :set_event, only: %i[show edit update destroy]
  before_action :protect_user_resources, only: %i[edit update destroy]
  before_action :verify_organizer, only: %i[new edit create update destroy]
  before_action :verify_registration_complete, except: %i[index show]

  ##
  # GET /events
  def index
    @events = if params[:search]
                Event.not_past.search(params[:search]).page(params[:page]).per(10).order(start_date: :asc)
              else
                Event.not_past.page(params[:page]).per(10).order(start_date: :asc)
              end
  end

  ##
  # GET /events/:event_slug
  def show
    @comments = @event.comments.all
  end

  ##
  # GET /users/:user_id/events/new
  def new
    @event = @user.events.new
  end

  ##
  # GET /users/:user_id/events/:event_slug/edit
  def edit; end

  ##
  # POST /users/:user_id/events
  def create
    @event = @user.events.create(event_params)

    if @event.save
      track('Event Creation Success', @event.attributes)
      redirect_to event_path(@event), notice: I18n.t('notices.event.create')
    else
      track('Event Creation Failure', @event.errors.messages)
      flash.now[:alert] = @event.errors.full_messages
      render :new
    end
  end

  ##
  # PATCH/PUT /users/:user_id/events/:event_id
  def update
    if @event.update(event_params)
      track('Event Update Success', event_params)
      redirect_to event_path(@event), notice: I18n.t('notices.event.update')
    else
      track('Event Update Failure', @event.errors.messages)
      flash.now[:alert] = @event.errors.full_messages
      render :edit
    end
  end

  ##
  # DELETE /users/:user_id/events/:event_id
  def destroy
    if @event.destroy
      track('Event Destruction Success', id: @event.id)
      redirect_to events_path, notice: I18n.t('notices.event.destroy')
    else
      track('Event Destruction Failure', @event.errors.messages)
      redirect_to event_path(@event), alert: @event.errors.full_messages
    end
  end

  private

  ##
  # Define permitted parameters.
  def permitted_event_params
    %i[name category summary fee start_date end_date time_zone user_id location_id]
  end

  ##
  # Filter parameters.
  def event_params
    params.require(:event).permit(permitted_event_params)
  end
end
