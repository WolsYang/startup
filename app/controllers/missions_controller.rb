class MissionsController < ApplicationController
	def index
		@missions = Mission.all
	end
	
	def new
		@mission = Mission.new
	end
	
	def create
		@mission = Mission.new(mission_params)
		
		if @mission.save
			#成功
			redirect_to missions_path, notice: "新增任務成功"
		else
			#失敗
		render :new
		end
	end
	
	private
    def mission_params
      params.require(:mission).permit(:name, :kind, :content, :state, :level, :end_date, :supervisor)
    end
end
