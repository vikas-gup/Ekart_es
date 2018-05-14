class Cart < ActiveRecord::Base
  attr_accessible :float, :integer,, :integer,, :item_id, :quantity, :total_price, :user_id
end
