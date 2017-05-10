class ChangeAgeToBirthFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :age, :integer
    add_column :profiles, :birth, :date
  end
end
