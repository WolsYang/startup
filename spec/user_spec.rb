require "./user"

RSpec.describe User do

	describe "人員版首頁" do
		it "列出所有的人員" do
			@user = User.all
			get :index
		end
	end
		describe "新增人員" do
		it "到新增人員頁先創一個實體給viewCALL" do
			@user = User.new
		end
		
		it "從表單取得資料create人員" do
			@user = User.new(user_params)
			@user.save
		end
	end	
	
	describe "編輯人員" do	
		it "編輯頁面"
		it "編輯功能" do
			@user.update(user_params)
		end	
    end
	
	describe "刪除人員" do
		it  "把人員刪除" do
			@user.destroy if @user
		end
	end
	
	describe "刪除人員任務" do
		it "找出目標人員及人員然後刪除" do
			user = User.find(2)
			mission = Mission.find(1)
		end
	end
	
	describe "params 清洗" do
		it "只允許特定params通過" do
			params.require(:user).permit(:name, :email, :root)
		end
	end
	
	describe "找出現在的人員" do
		it "列出目前人員的前置作業" do	
			@user = User.find_by(id: params[:id])
		end
	end

end