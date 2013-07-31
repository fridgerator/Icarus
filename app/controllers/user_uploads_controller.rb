class UserUploadsController < ApplicationController

	# TODO: determine which method to use (apache, nginx)
	SEND_FILE_METHOD = :apache

	def download
		head(:not_found) and return if (user_upload = UserUPload.find_by_id(params[:id])).nil?
		head(:forbidden) and return unless user_upload.downloadable?(current_user)

		path = user_upload.file.path(params[:style])
		head(:bad_request) and return unless File.exist?(path) && params[:format].to_s == File.extname(path).gsub(/^\.+/, '')

		send_file_options = { type: File.mime_type?(path) }

		case SEND_FILE_METHOD
			when :apache then send_file_options[:x_sendfile] = true
			when :nginx then head(x_accel_redirect: path.gsub(Rails.root, ''), content_type: send_file_options[:type]) and return
		end

		send_file(path, send_file_options)
	end
end
