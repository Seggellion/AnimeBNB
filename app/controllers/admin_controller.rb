class AdminController < ApplicationController
before_action :admin_user

def index
  @user = User.find_by_id(current_user.id)
  @users = User.all
end

private

def admin_user
  redirect_to(root_path) unless current_user && current_user.admin?
end

end
