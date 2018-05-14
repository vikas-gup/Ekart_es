class Order < ActiveRecord::Base
  attr_accessible :cart_id, :datetime, :delivery_date, :estimated_delivery, :status, :user_id
end
