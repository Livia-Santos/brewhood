class RemoveTypeFromBeers < ActiveRecord::Migration[5.0]
  def change
    rename_column :beers, :type, :beer_type

  end
end
