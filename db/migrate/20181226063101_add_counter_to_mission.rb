class AddCounterToMission < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :user_logs_count, :integer
  end
end
