class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name,:birth, :address, :city, :state, :avatar, presence: true
  validates :description, length: { minimum: 25 }

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  def follow(profile_id)
    following_relationships.create(following_id: profile_id)
  end

  def unfollow(profile_id)
    following_relationships.find_by(following_id: profile_id).destroy
  end

  def follows?(profile_id)
    followers_id = following.map{|follower| follower.id }
    followers_id.include?(profile_id)
  end

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
