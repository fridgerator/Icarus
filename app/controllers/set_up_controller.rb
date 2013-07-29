class SetUpController < ApplicationController
	skip_before_filter :authenticate_user!
	skip_before_filter :first_user
	before_filter :already_set_up

  def index
  	@user = User.new
  end

  def set_up
  	redirect_to set_up_path if params[:password].blank? || params[:email].blank?
  	User.create(email: params[:email], password: params[:password])
  	redirect_to root_path
  end

  private

  # Actions in this controller should not be accessible if an account has already been set up.  
  def already_set_up
  	redirect_to root_path and return if User.count > 0
  end
end
