class CreateUserUploads < ActiveRecord::Migration
  def change
    create_table :user_uploads do |t|
      t.integer :user_id
      t.string :type

      t.timestamps
    end
    add_index :user_uploads, :user_id
  end
end
