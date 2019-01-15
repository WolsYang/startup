class MissionTag < ApplicationRecord
	belongs_to :mission , autosave: true
end
