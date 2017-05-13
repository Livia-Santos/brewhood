class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name,:birth, :address, :city, :state, presence: true
  validates :description, length: { minimum: 25 }


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def country
    ISO3166::Country.new(country_code)
  end

  def full_name
    [first_name, last_name].compact.join(" ")
  end

  def full_adress
    [address,city, state,country.name].compact.join(", ")
  end

  def self.search(search)
    where("first_name ILIKE ?", "%#{search}%")
  end

end
