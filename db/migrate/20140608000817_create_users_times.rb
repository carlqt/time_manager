class CreateUsersTimes < ActiveRecord::Migration
  def change
    create_table :users_times do |t|
      t.date :logged_in_date
      t.datetime :logged_in_time
      t.datetime :logged_out_time
      t.integer :user_id
      t.string :email
      t.string :username

      t.timestamps
    end
  end
end
