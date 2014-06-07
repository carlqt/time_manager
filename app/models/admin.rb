# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Admin < ActiveRecord::Base
  belongs_to :user

  validates :email, :presence => true
  validates :email, uniqueness: true

end
