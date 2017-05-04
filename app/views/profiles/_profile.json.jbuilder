json.extract! profile, :id, :user_id, :avatar, :first_name, :last_name, :age, :addres, :city, :state, :country_code, :brewing_since, :facebook, :twitter, :instagram, :created_at, :updated_at
json.url profile_url(profile, format: :json)
