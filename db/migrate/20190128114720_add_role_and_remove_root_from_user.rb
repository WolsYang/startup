class AddRoleAndRemoveRootFromUser < ActiveRecord::Migration[5.2]
  def change
  	drop_table :mission_tags
  	add_column :users, :role, :string
  	remove_column :users , :root
  end
end
