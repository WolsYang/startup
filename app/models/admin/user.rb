class Admin::User < User
  def toggle_admin!
    self.admin = !self.admin
  end
end