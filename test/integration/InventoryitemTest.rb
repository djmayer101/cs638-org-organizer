require '../test_helper'

class InventoryitemTest < ActionController::IntegrationTest
  include Devise::TestHelper 
   
  test "Adds item" do
   visits "/inventoryitems"
   assert_response :success
   clicks "Add Item"
   page.should have_content "NEW ITEM"
   fill_in "Name", :with => "Name"
   fill_in "Cost", :with => "5"
   fill_in "Count", :with => "15" 
  end
  
  test "Tries to destroy item" do

    #Go to inventoryitems page
    visits "/inventoryitems"
    assert_response :success
    #test deletion of an item
    clicks "Destroy"
    page.should have_content "Are you sure?"
    
  end

end 
