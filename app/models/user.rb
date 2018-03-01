class User < ApplicationRecord
  has_one :profile
  has_many :beers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, uniqueness: true;
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
