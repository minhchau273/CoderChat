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

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id', dependent: :destroy

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

  def unread_messages_to_user(recipient_id)
    sent_messages.where(recipient_id: recipient_id, seen_at: nil)
  end

  def unread_messages_from_user(sender_id)
    messages = received_messages.where(sender_id: sender_id, seen_at: nil).to_a
    remove_blocked_messages(messages)
  end

  def unread_messages
    messages = received_messages.where(seen_at: nil).order(created_at: :desc).to_a
    remove_blocked_messages(messages)
  end

  private

  def remove_blocked_messages(messages)
    messages.delete_if do |message|
      has_blocked_user?(message.sender)
    end
  end
end
