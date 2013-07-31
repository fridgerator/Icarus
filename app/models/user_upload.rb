class UserUpload < ActiveRecord::Base

	# Associations
	belongs_to :user

	# Paperclip
	has_attached_file :file,
										url: '/:class/:id/:style.:extension',
										path: ':rails_root/user_uploads/:class/:id_partition/:style.:extension'

	# Validations
	validates_attachment_presence :file
	# TODO: add custom validation for file size once we get account settings for users / groups

	# if user owns the upload, they can download it
	def downloadable?(user)
		user.id == user_id
	end

end
