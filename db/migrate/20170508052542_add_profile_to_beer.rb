class AddProfileToBeer < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :profile_id, :integer
  end
end
