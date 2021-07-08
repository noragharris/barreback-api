require "rails_helper"

RSpec.describe EquipmentItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/equipment_items").to route_to("equipment_items#index")
    end

    it "routes to #show" do
      expect(get: "/equipment_items/1").to route_to("equipment_items#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/equipment_items").to route_to("equipment_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/equipment_items/1").to route_to("equipment_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/equipment_items/1").to route_to("equipment_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/equipment_items/1").to route_to("equipment_items#destroy", id: "1")
    end
  end
end
