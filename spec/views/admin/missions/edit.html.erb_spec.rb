require 'rails_helper'

RSpec.describe "admin/missions/edit", type: :view do
  before(:each) do
    @admin_mission = assign(:admin_mission, Admin::Mission.create!())
  end

  it "renders the edit admin_mission form" do
    render

    assert_select "form[action=?][method=?]", admin_mission_path(@admin_mission), "post" do
    end
  end
end
