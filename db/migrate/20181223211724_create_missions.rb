class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :name
      t.string :kind
      t.text :content
      t.integer :state
      t.integer :end_date
      t.string :supervisor

      t.timestamps
    end
  end
end
