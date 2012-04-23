class Inventoryitem < ActiveRecord::Base
  validates :name, :cost, :count, :presence=> true;
  validates :cost, :count, :numericality => true;
  attr_accessible :cost, :count, :name
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
