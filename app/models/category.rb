class Category < ActiveRecord::Base
  attr_accessible :description, :name
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :items
  #Category.import
  #Category.import(force: true)
  # Category.__elasticsearch__.delete_index!
  # Category.__elasticsearch__.create_index!

  index_name('ekart_category_i')

  def as_indexed_json(options={})
    as_json(
        only: [:name]
    )
  end

end
