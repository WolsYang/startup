class UsersController < ApplicationController
	 before_action :find_user, only: [:edit, :update, :destroy, :add_user]

	def index
		@users = User.all
	end
	#C
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		
		if @user.save
			#成功
			redirect_to users_path, notice: "新增人員成功"
		else
			#失敗
		render :new
		end
	end
	#U
	def edit
    end
	
	def update
      if @user.update(user_params)
        # 成功
        redirect_to users_path, notice: "人員更新成功!"
      else
        # 失敗
        render :edit
      end
    end
	#D
	def destroy
      @user.destroy if @user
      redirect_to users_path, notice: "任務資料已刪除!"
    end

	def add_user
		@user = User.all
		@user = User.find_by(id: params[:id])	
	end
	#list mission's user
	def u_missions
		@user = User.find_by(id: params[:id])
		@missions = @user.missions.all
	end
	
	def rm_mission
	  @mission = Mission.find_by(user_id: params[:id])
	  @mission.destroy if @mission
      redirect_to missions_path, notice: "人員已刪除!"
	end
	
	private
    def user_params
      params.require(:user).permit(:name, :email, :root, :mission_id)
    end
	
	def find_user
		@user = User.find_by(id: params[:id])
	end
end
