class CreateMissionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_tags do |t|
      t.string :tag
      t.references :mission, foreign_key: true
      t.timestamps
    end
  end
end
