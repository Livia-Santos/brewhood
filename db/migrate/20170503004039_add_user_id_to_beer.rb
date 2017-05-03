class AddUserIdToBeer < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :user_id, :integer
  end
end
