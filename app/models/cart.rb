class Cart < ActiveRecord::Base
  attr_accessible :item_id, :quantity, :total_price, :user_id
  belongs_to :user
  has_many :item_cart_mappings
  has_many :items, through: :item_cart_mappings
end
