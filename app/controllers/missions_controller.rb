class MissionsController < ApplicationController
	 before_action :find_mission, only: [:edit, :update, :destroy, :m_users]

	def index
		@missions = Mission.all
	end
	#C
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
	#U
	def edit
    end
	
	def update
      if @mission.update(mission_params)
        # 成功
        redirect_to mission_path, notice: "任務更新成功!"
      else
        # 失敗
        render :edit
      end
    end
	#D
	def destroy
      @mission.destroy if @mission
      redirect_to missions_path, notice: "任務資料已刪除!"
    end
	#list mission's user
	#試試把目前的任務先記錄下來
	def m_users
		@users = @mission.users.all
		#return @mission  #為什麼不能回傳
	end
	
	def rm_user #為啥抓不到m_user
	  user = User.find(params[:id])
	  mission = Mission.find_by(id: params[mission_id]) 
	  #if mission
	  User.mission.delete(mission)
	  #user = Mission.where(user_id: params[:id], mission_id: @mission.id)
	  #@mission.users.find.delete(@user) #if @mission
      #redirect_to missions_path, notice: "人員已刪除!"
	  #end
	end
	
	private
    def mission_params
      params.require(:mission).permit(:name, :kind, :content, :state, :level, :end_date, :supervisor , :user_id)
    end
	
	def find_mission
		@mission = Mission.find_by(id: params[:id])
	end
end
