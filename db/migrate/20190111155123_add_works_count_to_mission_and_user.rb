class AddWorksCountToMissionAndUser < ActiveRecord::Migration[5.2]
	#避免噴錯誤
  def change
  	add_column :missions, :works_count, :integer
  	add_column :users, :works_count, :integer
  end
end
