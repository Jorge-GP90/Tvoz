# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]


  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to profile_user_path(user.id)
    flash[:notice] = 'Teacher guest has been login！'
  end
 
  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to profile_user_path(user.id)
    flash[:notice] = 'Admin guest has been login！'
  end
  
  def after_sign_in_path_for(resource)
    profile_user_path(resource)
  end
end
