# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]


  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.role = 'teacher'
    end
    sign_in user
    redirect_to root_path, notice: 'Teacher user has been login'
  end



  def guest_admin
    admin_guest = User.find_or_create_by!(email: 'adminguest@example.com') do |admin_guest|
      admin_guest.password = SecureRandom.urlsafe_base64
      admin_guest.role = 'teacher'
      admin_guest.admin = true
    end
    sign_in admin_guest
    redirect_to root_path, notice: 'Admin user has been login'
  end

  
  def after_sign_in_path_for(resource)
    profile_user_path(resource)
  end
end
