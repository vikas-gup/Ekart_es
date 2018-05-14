class User < ActiveRecord::Base
  attr_accessible :contact_number, :email, :firstname, :lastname
  validates :email, uniqueness: true
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
