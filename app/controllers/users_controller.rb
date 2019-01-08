class UsersController < ApplicationController
	before_action :find_user, only: [:edit, :update, :destroy, :add_user, :add_mission_to]
	before_action :chek_mission_state, only: [:add_mission_to]
	before_action :check_login, except: [:login, :login, :signup, :create_login_session, :create ]
	layout "login", only: [:login, :signup, :create_login_session]
	
	def  index	
		@users = User.all
	end
	
	def signup
		@user=User.new
	end
	
	def login
	end
	
	def create_login_session
	user =User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
		  session[:user_id]=user.id
		  redirect_to root_path
		else
		  redirect_to :login, notice: "沒有找到您的資料喔"
		end
	end

	def logout
		session[:user_id]=nil
		redirect_to login_path
	end
	
	
	def create
		puts "777777"
		@user = User.new(user_params)
		puts "888888"
		if @user.save
			#成功
			redirect_to :login, notice: "新增人員成功"
		else
			#失敗
		render :signup, notice: "新增人員失敗"
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
	  work = Work.find_by(mission_id: params[:id], user_id: params[:user_id])
	  work.destroy
      redirect_to missions_path, notice: "人員已刪除!"
	end
	
	def add_mission_to
		unless Work.exists?(mission_id: @mission_id , user_id: params[:id]) == true
			@user.missions << @mission
			redirect_to u_missions_user_path, notice: "新增任務成功"		
		else
			redirect_to u_missions_user_path, notice: "任務已存在"
		end
	end
	
	private
    def user_params
      params.require(:user).permit(:name, :email, :root, :mission_ids, :user, :password)
    end
	
	def find_user
		@user = User.find_by(id: params[:id])
	end
	
	def chek_mission_state
		if params[:mission][:name].blank? 
			@mission = Mission.find_by(id: params[:user][:mission_ids])
			@mission_id = @mission.id
		elsif Mission.exists?(name: params[:mission][:name]) == true
			@mission = Mission.find_by("name = ?", params[:mission][:name])	
			@mission_id = @mission.id
		elsif Mission.exists?(name: params[:mission][:name]) == false
			redirect_to u_missions_user_path, notice: "此任務不存在"
		end
	end	
end
