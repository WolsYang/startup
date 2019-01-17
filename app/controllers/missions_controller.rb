class MissionsController < ApplicationController
	before_action :check_login
	before_action :find_mission, only: [:edit, :update, :destroy, :m_users, :add_user_to]
	before_action :chek_user, only: [:add_user_to]
	before_action :validates_search_key, only: [:search]
	before_action :check_create_by, only: [:update, :destroy, :m_users, :rm_user, :add_user_to]

	def index 
		sort_by = (params[:order] == 'end_date') ? 'end_date' : 'created_at'
		@missions =Mission.where(create_by: @current_user.name).order(sort_by).page(params[:page]).per(5)
	end

 	def search
 		@missions = Mission.ransack( name_or_content_cont: @q, create_by_eq: @current_user.name ).result(distinct: true).page(params[:page]).per(5)
  	end

	def new
		@mission = Mission.new
		@mission.mission_tags.build
	end
	
	def create
		@mission = Mission.new(mission_params)
		@mission.mission_tags.build(mission_params[:mission_tags])
		@mission.create_by = @current_user.name

		if @mission.save 
			redirect_to missions_path, notice: "新增任務成功"
		else
			render :new
		end
	end
	
	def edit
			@mission.mission_tags.build
    end
	
	def update

	    if @mission.update(mission_params) #|| @mission.mission_tags.build(mission_params[:mission_tags])
	        redirect_to missions_path, notice: "任務更新成功!"
	    else
	        render :edit
	    end
    end

	def destroy
		if @mission.users.size >0
			redirect_to missions_path, notice: "任務尚有人員未刪除!"
		else	
    		@mission.destroy if @mission
      		redirect_to missions_path, notice: "任務資料已刪除!"
      	end
    end
	
	def m_users #該任務處理人員
		@users = @mission.users.all
		@now_mission = Mission.find(params[:id])
	end
	
	def rm_user 
	  #work = Work.find_by(mission_id: params[:mission_id], user_id: params[:id])
	  #work.destroy
	  user = User.find_by(id: params[:id])
	  mission = Mission.find_by(id: params[:mission_id])
	  mission.users.destroy(user)
	  redirect_to missions_path, notice: "人員已移除!"
	end
	
	def add_user_to
		unless Work.exists?(mission_id: params[:id], user_id: @user_id) == true
			@mission.users << @user
			redirect_to m_users_mission_path, notice: "新增人員成功"		
		else
			redirect_to m_users_mission_path, notice: "人員已存在"
		end
	end
	
private

    def mission_params
      params.require(:mission)
      	.permit(:name, :kind, :content, :state, :level, :end_date, :supervisor, :order,
      		mission_tags_attributes: [:tag1, :tag2, :tag3, :tag4, :tag5])
    end
	
	def find_mission
		@mission = Mission.find_by(id: params[:id])
	end
	
	def chek_user
		if params[:user][:name].blank? 
			@user = User.find_by(id: params[:mission][:user_ids])
			@user_id = @user.id
		elsif User.exists?(name: params[:user][:name]) == true
			@user = User.find_by("name = ?", params[:user][:name])	
			@user_id = @user.id
		elsif User.exists?(name: params[:user][:name]) == false
			redirect_to m_users_mission_path, notice: "此人員不存在"
		end
	end

	def check_create_by
		unless @mission.create_by == @current_user.name
			redirect_to missions_path, notice: "這並非您擁有的任務喔!"
		end		
	end

protected
 
	def validates_search_key
		if params[:query_string].blank?
			redirect_to missions_path
 		else
 			@q = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
 		end
 	end
end
