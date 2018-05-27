class Item < ActiveRecord::Base
  attr_accessible :brand, :category_id, :name, :price
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  #Item.import
  #Item.import(force: true)
  # Item.__elasticsearch__.delete_index!
  # Item.__elasticsearch__.create_index!

  index_name('ekart_item_i')
  def as_indexed_json(options={})
    as_json(
        include: {:category => { :only => [ :name ] } }
    )
  end


  belongs_to :category
  has_one :store

  has_many :item_cart_mappings
  has_many :carts, through: :item_cart_mappings

  #custom elastic search method
  # def self.search(query)
  #   __elasticsearch__.search(
  #       {
  #           query: {
  #               multi_match: {
  #                   query: query,
  #                   fields: ['name', 'brand', 'price']
  #               }
  #           }, sort: {_score: {order: :desc}}
  #       }
  #   )
  # end
end
