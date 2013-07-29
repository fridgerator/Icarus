class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :first_user
  before_filter :authenticate_user!

  private

  # Check if no users exist, redirect to set_up
  def first_user
		redirect_to set_up_path and return if User.count < 1
  end
end
