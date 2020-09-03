class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :meal_entries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # def generate_jwt
  #   JWT.encode({ id: id,
  #               exp: 60.days.from_now.to_i },
  #              Rails.application.secrets.secret_key_base)
  # end
  
end
