# require 'factory_girl_rails'
class WelcomeController < ApplicationController
  before_action :require_login

  def index
    # user1 = FactoryGirl.build(:user)
    # user1.save
  end
end
