class Beer < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :orders
  acts_as_votable

  validates :name, :beer_type, :unit_type, :price, :quantity, presence: true
  validates :description, length: { minimum: 25 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_attached_file :image, styles: { medium: "700x500#", small: "350x250#", thumb:"100X100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def price_in_cents
    (price * 100).to_i
  end

end
