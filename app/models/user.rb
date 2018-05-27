class User < ActiveRecord::Base
  attr_accessible :contact_number, :email, :firstname, :lastname

  #User.import
  #User.import(force: true)
  # User.__elasticsearch__.delete_index!
  # User.__elasticsearch__.create_index!
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name('ekart_user_i')
  validates :email, uniqueness: true
  has_one :cart
  has_many :orders
end
