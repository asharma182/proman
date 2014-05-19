require 'digest/sha1'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :birthday,
  :first_name, :last_name,:phone_no, :location, :image, :user_id
  # attr_accessible :title, :body
  has_many :projects
  has_many :topics
  has_many :discussions
  has_many :todos
  belongs_to :add_user_to_project
  mount_uploader :image,ImageUploader

   def devise_mailer
    UserMailer
  end

end
