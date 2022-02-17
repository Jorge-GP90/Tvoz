class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: %i[show profile community]
  # include UsersHelper

  def show
    if @user.nil?
      redirect_to root_url
      flash[:alert] = 'Page not found'
    else
      @users = User.select(:id, :name, :email, :admin, :role, :avatar).order(created_at: :DESC).page.per(10)
      @tasks = Task.select(:id, :title, :content, :image, :audio_record, :audio, :created_at, :user_id).order(created_at: :DESC).page.per(3)
    end
  end

  def profile
    if @user.id == current_user.id || current_user.admin?
      @users = User.select(:id, :name, :email, :admin, :role, :avatar).order(created_at: :DESC).page.per(5)
      @tasks = Task.select(:id, :title, :content, :image, :audio_record, :audio, :created_at, :user_id).order(created_at: :DESC).page.per(3)
      @followed = current_user.follower.includes(:followed).order(created_at: :DESC)
      @follower = current_user.followed.includes(:follower).order(created_at: :DESC)
    else
      redirect_to tasks_path
    end
  end

  def private_message

  end
  
  def community
    @users = User.select(:id, :name, :email, :role, :avatar, :admin ).order(created_at: :DESC).page.per(5)
    @tasks = current_user.tasks.select(:id, :title, :content, :image, :audio_record, :audio, :created_at, :user_id).order(created_at: :DESC).page.per(3)
    @followed = current_user.follower.includes(:followed).order(created_at: :DESC)
    @follower = current_user.followed.includes(:follower).order(created_at: :DESC)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :role, :admin, :task_id, :follower_id, :followed_id, :created_at, :status, :page)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
