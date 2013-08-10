# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  school          :string(255)
#  address         :string(255)
#  phone_number    :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  topics_count    :integer          default(0)
#  posts_count     :integer          default(0)
#

class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone_number, :school, :password, :password_confirmation 
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :forums, :dependent => :destroy


  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => {:with => VALID_EMAIL_REGEX}, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true

   def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
  end

   private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end	
