class Store < ActiveRecord::Base
  attr_accessible :integer, :item_id, :pieces_remaining
end
