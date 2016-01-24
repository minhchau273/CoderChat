class FriendshipController < ApplicationController
  def create
    new_friend_id = params[:new_friend_id]
    new_friend = User.find_by_id(new_friend_id)
    if new_friend
      Friendship.create(user1: current_user, user2: new_friend)
      redirect_to society_path(type: 'friend'), success: "#{new_friend.name} has been added to your friend list!"
    else
      flash[:error] = "This user doesn't exist!"
      redirect_to society_path
    end
  end

  def destroy
    friend_id = params[:friend_id]
    friend = User.find_by_id(friend_id)
    if friend
      friendship = Friendship.find_by(user1: current_user, user2: friend) || Friendship.find_by(user2: current_user, user1: friend)
      Friendship.delete(friendship.id)
      redirect_to society_path(type: 'friend'), success: "#{friend.name} has been removed from your friend list!"
    else
      flash[:error] = "This user doesn't exist!"
      redirect_to society_path
    end
  end
end
