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
			redirect_to missions_path, notice: "QWERETY"
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
		@now_mission = Mission.find(params[:id])
		#return @mission  #為什麼不能回傳
	end
	
	def rm_user #為啥抓不到m_user
	  user = User.find(2)
	  mission = Mission.find(1)
	  if mission
	  mission.users.destroy(user)
	  end
	  #redirect_to missions_path, notice: "任務資料已刪除!"
	end
	
	private
    def mission_params
      params.require(:mission).permit(:name, :kind, :content, :state, :level, :end_date, :supervisor , :user_id)
    end
	
	def find_mission
		@mission = Mission.find_by(id: params[:id])
	end
end
