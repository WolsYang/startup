require 'rails_helper'

RSpec.describe "admin/missions/new", type: :view do
  before(:each) do
    assign(:admin_mission, Admin::Mission.new())
  end

  it "renders new admin_mission form" do
    render

    assert_select "form[action=?][method=?]", admin_missions_path, "post" do
    end
  end
end
