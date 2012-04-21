class Inventoryitem < ActiveRecord::Base
  validates :name, :cost, :count, :presence=> true;
  validates :cost, :count, :numericality => true;
  
end
