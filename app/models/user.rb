class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :token_authenticatable # add this for tiddle
  has_many :toilets
  has_many :reviews
  has_many :favorites
  has_many :authentication_tokens # add this for tiddle
end
