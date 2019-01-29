class AddCreateByToMission < ActiveRecord::Migration[5.2]
  def change
  	add_column :missions, :create_by, :string
  end
end
