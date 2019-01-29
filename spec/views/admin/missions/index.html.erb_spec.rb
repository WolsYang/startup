require 'rails_helper'

RSpec.describe "admin/missions/index", type: :view do
  before(:each) do
    assign(:admin_missions, [
      Admin::Mission.create!(),
      Admin::Mission.create!()
    ])
  end

  it "renders a list of admin/missions" do
    render
  end
end
