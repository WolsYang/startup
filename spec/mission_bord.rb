class MissionBord
	def initialize(mission)
    @mission = mission
	end
	class  << self
	
		def all
		end

		def new
		end
		
		def save(mission_params)
			@mission = Mission.new(mission_params)
			@mission.save
		end
		
		def destroy
			@mission.destroy 
		end
		
		def 
		end
end