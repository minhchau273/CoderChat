class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :on => :create

  IMAGE_BASE_URL = "http://loremflickr.com/240/240/"

  def image_url
    "#{IMAGE_BASE_URL}#{name.partition(" ").first}"
  end

  def is_friend_with(user_id)
    friendship = Friendship.find_by(user1_id: id, user2_id: user_id) || Friendship.find_by(user2_id: id, user1_id: user_id)
    friendship ? true : false
  end

  def has_blocked_user(user_id)
    Block.find_by(user_id: id, blocked_user_id: user_id) ? true : false
  end
end
