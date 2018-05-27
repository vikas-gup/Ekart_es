class Store < ActiveRecord::Base
  attr_accessible :item_id, :pieces_remaining
  belongs_to :item
end
