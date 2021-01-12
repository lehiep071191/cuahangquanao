class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_many :orders
  has_many :comments
  has_many :rates
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def current_user?(user)
  	user && user == self
  end
end
