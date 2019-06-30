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
                Event.not_past.search(params[:search]).page(params[:page]).per(10).order(start_date: :asc, start_time: :asc)
              else
                Event.not_past.page(params[:page]).per(10).order(start_date: :asc, start_time: :asc)
              end
  end

  ##
  # GET /events/:event_slug
  def show; end

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
    @event = @user.events.create(event_from_params)

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
    if @event.update(event_from_params)
      track('Event Update Success', event_from_params)
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
  # Provide a hash of the event from parameters.
  def event_from_params
    {
      name: event_params[:name],
      category: event_params[:category],
      summary: event_params[:summary],
      fee: event_params[:fee],
      start_date: event_params[:start_date],
      start_time: start_time_from_params,
      end_date: event_params[:end_date],
      end_time: end_time_from_params,
      time_zone: event_params[:time_zone],
      user_id: event_params[:user_id],
      location_id: event_params[:location_id]
    }
  end

  ##
  # Retrieve start time from provided parameters.
  def start_time_from_params
    if event_params[:start_time].present?
      event_params[:start_time]
    else
      params_to_time(event_params[:start_time_hr],
                     event_params[:start_time_min],
                     event_params[:start_time_period],
                     event_params[:time_zone])
    end
  end

  ##
  # Retrieve end time from provided parameters.
  def end_time_from_params
    if event_params[:end_time].present?
      event_params[:end_time]
    else
      params_to_time(event_params[:end_time_hr],
                     event_params[:end_time_min],
                     event_params[:end_time_period],
                     event_params[:time_zone])
    end
  end

  ##
  # Define permitted parameters.
  def permitted_event_params
    %i[name category summary fee start_date start_time start_time_hr start_time_min start_time_period
       end_date end_time end_time_hr end_time_min end_time_period time_zone user_id location_id]
  end

  ##
  # Filter parameters.
  def event_params
    params.require(:event).permit(permitted_event_params)
  end
end
