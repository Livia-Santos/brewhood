class ChangeContentProfile < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :contet, :content
  end
end
