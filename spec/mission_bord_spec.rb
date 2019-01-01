require "./mission_bord"

RSpec.describe MissionBord do

	describe "任務版首頁" do
		it "列出所有的任務" do
			mission = Mission.all
			get :index
		end
	end
		describe "新增任務" do
		it "到新增任務頁先創一個實體給viewCALL" do
			@mission = Mission.new
		end
		
		it "從表單取得資料create任務" do
			@mission = Mission.new(mission_params)
			@mission.save
		end
	end	
	
	describe "編輯任務" do	
		it "編輯頁面"
		it "編輯功能" do
			@mission.update(mission_params)
		end	
    end
	
	describe "刪除任務" do
		it  "把任務刪除" do
			@mission.destroy if @mission
		end
	end

	describe "新增任務成員" do
		it "列出任務所有人員" do
			users = mission.users.all
		end
	end
		
	describe "刪除任務成員" do
		it "找出目標人員及任務然後刪除" do
			user = User.find(2)
			mission = Mission.find(1)
		end
	end
	
	describe "params 清洗" do
		it "只允許特定params通過" do
			params.require(:mission).permit(:name, :kind, :content, :state, :level, :end_date, :supervisor , :user_id)
		end
	end
	
	describe "找出現在的任務" do
		it "列出目前任務的前置作業" do	
			@mission = Mission.find_by(id: params[:id])
		end
	end

end

