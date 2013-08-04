class AddAttachmentFileToUserUploads < ActiveRecord::Migration
  def self.up
    change_table :user_uploads do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :user_uploads, :file
  end
end
