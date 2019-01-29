require 'rails_helper'

RSpec.describe "admin/missions/show", type: :view do
  before(:each) do
    @admin_mission = assign(:admin_mission, Admin::Mission.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
