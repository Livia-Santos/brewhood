class Beer < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_votable

  has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
