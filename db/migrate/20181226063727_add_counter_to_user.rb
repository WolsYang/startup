class AddCounterToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mission_logs_count, :integer
  end
end
