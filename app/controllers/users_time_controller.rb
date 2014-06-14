class UsersTimeController < ApplicationController
  def in
    current_user.time_in
    redirect_to site_index_path
  end

  def out
    current_user.time_out
    render nothing: true
  end
end
