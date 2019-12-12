# frozen_string_literal: true

##
# = FavoriteEventsController
# Author::    Richard Davis
#
# This controller provides methods for favorite events business logic.
class FavoriteEventsController < ApplicationController
  before_action :require_login
  before_action :protect_user_resources, only: :index
  before_action :set_user
  before_action :set_event, only: %i[create destroy]

  ##
  # GET /users/:user_id/favorites
  def index
    @favorite_events = @user.favorites.page(params[:page]).per(10).order(start_date: :desc)
  end

  ##
  # POST /users/:user_id/events/:event_id/favorite
  def create
    @favorite = current_user.favorite_events.create(event_id: @event.id)

    if @favorite.save
      track('Favorite Creation Success', @favorite.attributes)
      head :ok
    else
      track('Favorite Creation Failure', @favorite.errors.messages)
      head :internal_server_error
    end
  end

  ##
  # DELETE /users/:user_id/events/:event_id/unfavorite
  def destroy
    if current_user.favorite_events.where(event: @event).destroy_all
      track('Favorite Destruction Success', favorite_params: { user_id: @user.id, event_id: @event.id })
      head :ok
    else
      track('Favorite Destruction Failure', @favorite.errors.messages)
      head :internal_server_error
    end
  end
end
