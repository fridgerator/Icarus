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

	#
	# whether or not a user can download the file (for now just if same user)
	#
	def downloadable?(user)
		user.id == user_id
	end

	#
	# 	renames user upload (file and database record)
	#
	def rename(new_name)
		# rename path in case of sub classes
		path = self.file.path.gsub(self.type.underscore.pluralize, 'user_uploads')

		# rename file
		begin
			FileUtils.move(path, File.join(File.dirname(path), new_name.to_s))
		rescue ArgumentError => e # same file error, didn't change file name in form
			logger.debug "#{e}"
		end

		# rename database record
		self.update_attributes(file_file_name: new_name)
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
