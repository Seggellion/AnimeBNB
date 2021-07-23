module ApplicationHelper

def comment

end

def admin_page?
  url = request.path_info
   if url.include?('admin')
     return true
   end
end

def remaining_sign_ups(user_level)
  user_count = User.where(user_level: user_level).count
  remaining = 600 - user_count
  return remaining
end

def max_user_level(user_level)

  user_count = User.where(user_level: user_level).count
  if user_count >= 600
    return false
  else
    return true
  end

end

def resource_name
  :user
end

def resource
  @user ||= User.new
end
def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
end

end
