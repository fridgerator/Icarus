class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :first_user
  # before_filter :authenticate_user!

  private

  def first_user
  	if User.count < 1
  		redirect_to set_up_path
  	end
  end
end
