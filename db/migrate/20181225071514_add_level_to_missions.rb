class AddLevelToMissions < ActiveRecord::Migration[5.2]
  def change
	add_column :missions, :level, :integer
  end
end
