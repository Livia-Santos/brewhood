class ChangeStreet < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :street, :address
  end
end
