class AddMoreTagsToMissionTags < ActiveRecord::Migration[5.2]
  def change
  	remove_column :mission_tags, :tag, :string
  	add_column :mission_tags, :tag1, :string
  	add_column :mission_tags, :tag2, :string
  	add_column :mission_tags, :tag3, :string
  	add_column :mission_tags, :tag4, :string
  	add_column :mission_tags, :tag5, :string
  end
end
