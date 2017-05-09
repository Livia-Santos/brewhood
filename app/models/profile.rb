class Profile < ApplicationRecord
  belongs_to :user
  validates :address, presence: true


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :beers

  def country
    ISO3166::Country.new(country_code)
  end

  def full_name
    [first_name, last_name].compact.join(" ")
  end

  def full_adress
    [address,city, state,country.name].compact.join(", ")
  end

end
