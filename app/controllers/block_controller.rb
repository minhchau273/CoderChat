class BlockController < ApplicationController
  def create
    blocked_user_id = params[:blocked_user_id]
    blocked_user = User.find_by_id(blocked_user_id)
    if blocked_user
      Block.create(user: current_user, blocked_user: blocked_user)
      redirect_to society_path, success: "#{blocked_user.name} has been blocked!"
    else
      flash[:error] = "This user doesn't exist!"
      redirect_to society_path
    end
  end

  def destroy
    blocked_user_id = params[:blocked_user_id]
    blocked_user = User.find_by_id(blocked_user_id)
    if blocked_user
      block = Block.find_by(user: current_user, blocked_user: blocked_user)
      Block.delete(block.id)
      redirect_to society_path, success: "#{blocked_user.name} has been unblocked!"
    else
      flash[:error] = "This user doesn't exist!"
      redirect_to society_path
    end
  end
end
