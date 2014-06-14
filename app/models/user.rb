# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_one :admin
  has_many :users_time

  # scopes
  # scope :find_current_user, -> { where(logged_in_date: Time.now.to_date).last }
 
  def time_in
    unless is_timed_in?
      self.users_time.create(logged_in_time: Time.now, username: self.username, email: self.email, logged_in_date: Time.now.to_date)
    end

  end

  def time_out
    find_current_user.update_attribute(:logged_out_time, Time.now)
  end

  def is_timed_in?
    true if self.users_time.exists? or self.users_time.try(:logged_in_date) == Time.now.to_date
  end

  def find_current_user
    self.users_time.where(logged_in_date: Time.now.to_date).last
  end

end
