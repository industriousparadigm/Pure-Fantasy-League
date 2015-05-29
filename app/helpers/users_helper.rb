module UsersHelper

  def registered_admin?
    User.count > 0
  end

end
