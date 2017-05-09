class RemoveColumnFromBeer < ActiveRecord::Migration[5.0]
  def change
    remove_column :beers, :profile_id, :integer
  end
end
