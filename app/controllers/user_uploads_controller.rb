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
		@user_upload = UserUpload.new upload_params
		@user_upload.user_id = current_user.id
		@user_upload.save  # TODO: error handling
		redirect_to root_path
	end

	# destroy uploaded file
	def destroy
		@user_upload = UserUpload.find params[:id]
		@user_upload.destroy
	end

	private

	# whitelist params
	def upload_params
		params.require(:user_upload).permit(:file)
	end
end
