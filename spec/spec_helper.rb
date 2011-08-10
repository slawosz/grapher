$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'grapher'
require 'activerecord'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.before(:suite) do
    ActiveRecord::Base.establish_connection(
      "adapter" => "sqlite3",
      "database"  => "spec.db"
    )
    create_tables
    load_test_data
  end
  
  config.after(:suite) do
    destroy_tables
  end
end

def post(post)
  @@posts[post]
end
# setup database


# run migrations before


# load data

# remove tables after
