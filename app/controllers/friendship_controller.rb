class FriendshipController < ApplicationController
  def create
    new_friend_id = params[:new_friend_id]
    new_friend = User.find_by_id(new_friend_id)
    if new_friend
      Friendship.create(user1: current_user, user2: new_friend)
      redirect_to society_path, success: "#{new_friend.name} is added to your friend list!"
    else
      flash[:error] = "This user doesn't exist!"
      redirect_to society_path
    end
  end
end
