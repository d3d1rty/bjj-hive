# frozen_string_literal: true

##
# Controller for the dashboard
class DashboardController < ApplicationController
  before_action :require_login

  ##
  # GET /dashboard
  def show; end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end
end
