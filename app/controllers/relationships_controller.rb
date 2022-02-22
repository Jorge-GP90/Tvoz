class RelationshipsController < ApplicationController
  before_action :authenticate_user!



  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def destroy
    @user = Relationship.find_by(followed_id: params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.js { render :unfollow }
      format.html { redirect_to user_path(@user) }
    end 
  end
  

  def self.connect(followed)
    user = User.find(followed.user_id)
    if user.follower_user.include?(current_user)
    current_user.follow(@user)
    end
  end
  
end
