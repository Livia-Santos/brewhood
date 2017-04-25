class RemoveImageFromBeers < ActiveRecord::Migration[5.0]
  def change
    remove_column :beers, :image, :text
  end
end
