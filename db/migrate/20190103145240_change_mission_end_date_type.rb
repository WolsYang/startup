class ChangeMissionEndDateType < ActiveRecord::Migration[5.2]
  def change
	remove_column :missions, :end_date
	add_column :missions, :end_date, :date
  end
end
