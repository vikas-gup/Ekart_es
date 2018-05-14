# Load the rails application
require File.expand_path('../application', __FILE__)
require File.expand_path('../initializers/ek_mysql2_adapter', __FILE__)
require File.expand_path('../initializers/elasticsearch', __FILE__)
# Initialize the rails application
Ekart::Application.initialize!
