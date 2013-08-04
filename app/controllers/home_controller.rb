class HomeController < ApplicationController
  def index
  	@user_files = UserFile.all
  end

  def music
  	@music = Music.all
  end

  def photo
  	@photos = Photo.all
  end
end
