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
end
