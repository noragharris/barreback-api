require "rails_helper"

RSpec.describe BarreClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/barre_classes").to route_to("barre_classes#index")
    end

    it "routes to #show" do
      expect(get: "/barre_classes/1").to route_to("barre_classes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/barre_classes").to route_to("barre_classes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/barre_classes/1").to route_to("barre_classes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/barre_classes/1").to route_to("barre_classes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/barre_classes/1").to route_to("barre_classes#destroy", id: "1")
    end
  end
end
