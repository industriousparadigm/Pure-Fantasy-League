module ManagersHelper

  def setup_manager(manager)
    manager.tap do |m|
      m.build_user
    end
  end

end
