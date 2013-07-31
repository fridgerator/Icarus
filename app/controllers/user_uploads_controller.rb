class UserUploadsController < ApplicationController

	# download uploaded file
	def download
		head(:not_found) and return if (user_upload = UserUpload.find_by_id(params[:id])).nil?
		head(:forbidden) and return unless user_upload.downloadable?(current_user)

		path = user_upload.file.path(params[:style])
		head(:bad_request) and return unless File.exist?(path) && params[:format].to_s == File.extname(path).gsub(/^\.+/, '')

		send_file(path)
	end

	# create uploaded file
	def create
		@user_upload = Music.new upload_params
		@user_upload.user_id = current_user.id
		@user_upload.save
		redirect_to root_path
	end

	private

	# whitelist params
	def upload_params
		return params.require(:user_file).permit(:file) unless params[:user_file].blank?
		return params.require(:music).permit(:file) unless params[:music].blank?
		return params.require(:photo).permit(:file) unless params[:photo].blank?
	end
end
