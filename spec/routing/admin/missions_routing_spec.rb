require "rails_helper"

RSpec.describe Admin::MissionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/missions").to route_to("admin/missions#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/missions/new").to route_to("admin/missions#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/missions/1").to route_to("admin/missions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/missions/1/edit").to route_to("admin/missions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/missions").to route_to("admin/missions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/missions/1").to route_to("admin/missions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/missions/1").to route_to("admin/missions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/missions/1").to route_to("admin/missions#destroy", :id => "1")
    end
  end
end
