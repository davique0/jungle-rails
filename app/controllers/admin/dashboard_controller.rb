class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USER'], password: ENV['AUTH_KEY']

  def show
  end
end
