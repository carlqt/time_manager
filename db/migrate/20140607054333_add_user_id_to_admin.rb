class AddUserIdToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :user_id, :intege
  end
end
