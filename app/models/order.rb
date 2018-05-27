class Order < ActiveRecord::Base
  attr_accessible :cart_id, :delivery_date, :estimated_delivery, :status, :user_id
  has_many :items
  belongs_to :user
end
