class User < ApplicationRecord
  has_many :beers
  has_many :comments
  has_many :orders
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, uniqueness: true;
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
