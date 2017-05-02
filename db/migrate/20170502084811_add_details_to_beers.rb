class AddDetailsToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :quantity, :integer
    add_column :beers, :price, :decimal
    add_column :beers, :unit_type, :string
  end
end
