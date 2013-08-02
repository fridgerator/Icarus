class UserUpload < ActiveRecord::Base

	# Callbacks
	after_create :set_file_type

	# Associations
	belongs_to :user

	# Paperclip
	has_attached_file :file,
										url: '/:class/:id/:basename.:extension',
										path: ':rails_root/user_uploads/:class/:id_partition/:basename.:extension'

	# Validations
	validates_attachment_presence :file
	# TODO: add custom validation for file size once we get account settings for users / groups

	# for now, if user owns the upload they can download it
	def downloadable?(user)
		user.id == user_id
	end

	private

	def set_file_type
		audio = %w{ wav flac mp3 ogg wma m4a }
		images = %w{ tif gif png jgp jpeg bmp }
		if audio.include?(File.extname(file_file_name.downcase).gsub('.', ''))
			update_attribute('type', 'Music')
		elsif images.include?(File.extname(file_file_name.downcase).gsub('.', ''))
			update_attribute('type', 'Photo')
		else
			update_attribute('type', 'UserFile')
		end
	end

end
