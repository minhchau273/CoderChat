class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :on => :create

  # friends_1: list of friends I added
  has_many :friendships_with_1, class_name: 'Friendship', foreign_key: 'user2_id'
  has_many :friends_1, through: :friendships_with_1, source: :user1

  # friends_2: list of friends added me
  has_many :friendships_with_2, class_name: 'Friendship', foreign_key: 'user1_id'
  has_many :friends_2, through: :friendships_with_2, source: :user2

  has_many :blocks, class_name: 'Block', foreign_key: 'user_id'
  has_many :blocked_users, through: :blocks, source: :blocked_user


  IMAGE_BASE_URL = "http://loremflickr.com/240/240/"

  def image_url
    "#{IMAGE_BASE_URL}#{name.partition(" ").first}"
  end

  def friends
    friends_1 + friends_2
  end

  def is_friend_with?(user)
    friends.include?(user)
  end

  def has_blocked_user?(user)
    blocked_users.include?(user)
  end
end
