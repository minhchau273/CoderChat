module SocietyHelper
  def card_icon_url_based_on_2_users(current_user, user)
    friendship = current_user.is_friend_with?(user)
    block = current_user.has_blocked_user?(user)
    if block
      icon_url = BLOCK_ICON_URL
    else
      if friendship
        icon_url = TICK_ICON_URL
      else
        icon_url = ATTENTION_ICON_URL
      end
    end
  end
end
