class FriendsController < ApplicationController
  def index
  end
  
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Friend.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
