class UsersTimeController < ApplicationController
  def in
    current_user.time_in
    redirect_to site_index_path
  end

  def out
  end
end