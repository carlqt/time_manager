# == Schema Information
#
# Table name: users_times
#
#  id              :integer          not null, primary key
#  logged_in_date  :date
#  logged_in_time  :datetime
#  logged_out_time :datetime
#  user_id         :integer
#  email           :string(255)
#  username        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class UsersTime < ActiveRecord::Base
  belongs_to :users


end
