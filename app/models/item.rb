class Item < ActiveRecord::Base
  attr_accessible :brand, :category_id, :float, :integer, :name, :price, :string
end
