class ItemCartMapping < ActiveRecord::Base
  attr_accessible :item_id, :category_id
  belongs_to :item
  belongs_to :cart

  after_save :update_total_quantity_price

  def update_total_quantity_price
    total_items = ItemCartMapping.where(cart_id: self.cart_id).sum(:item_quantity)
    total_price = ItemCartMapping.where(cart_id: self.cart_id).joins(:item).sum(:price)
    self.cart.update_attributes(quantity: total_items, total_price: total_price)
  end
end
