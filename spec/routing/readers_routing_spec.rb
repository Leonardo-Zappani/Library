require "rails_helper"

RSpec.describe ReadersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/readers").to route_to("readers#index")
    end

    it "routes to #new" do
      expect(get: "/readers/new").to route_to("readers#new")
    end

    it "routes to #show" do
      expect(get: "/readers/1").to route_to("readers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/readers/1/edit").to route_to("readers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/readers").to route_to("readers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/readers/1").to route_to("readers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/readers/1").to route_to("readers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/readers/1").to route_to("readers#destroy", id: "1")
    end
  end
end
