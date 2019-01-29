class AddCountToWork < ActiveRecord::Migration[5.2]
  def change
  	add_column :works, :works_count, :integer
  end
end
