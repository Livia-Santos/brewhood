class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :beer, foreign_key: true
      t.integer :quantity
      t.string :stripe_charge_id

      t.timestamps
    end
  end
end
