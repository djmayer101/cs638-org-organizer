require "spec_helper"

describe InventoryitemsController do
  describe "routing" do

    it "routes to #index" do
      get("/inventoryitems").should route_to("inventoryitems#index")
    end

    it "routes to #new" do
      get("/inventoryitems/new").should route_to("inventoryitems#new")
    end

    it "routes to #show" do
      get("/inventoryitems/1").should route_to("inventoryitems#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inventoryitems/1/edit").should route_to("inventoryitems#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inventoryitems").should route_to("inventoryitems#create")
    end

    it "routes to #update" do
      put("/inventoryitems/1").should route_to("inventoryitems#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inventoryitems/1").should route_to("inventoryitems#destroy", :id => "1")
    end

  end
end
