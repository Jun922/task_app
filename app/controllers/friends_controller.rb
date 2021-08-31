class FriendsController < ApplicationController
  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def friend_params
    params.require(:friend).permit(user_ids:[])
  end
end
