class ModifyUsername < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :username, unique: true
    change_column :users, :username, :string, :null => false
  end
end
