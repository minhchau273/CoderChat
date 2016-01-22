class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, :email, presence: true
  validates_length_of :password, minimum: 6
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
