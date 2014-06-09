module AdminsHelper
  def is_admin?(user)
    true if user.try(:admin)
  end
end
