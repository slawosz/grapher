$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'grapher'
require 'active_record'
require 'rubygems'
require 'neo4j'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# Requires models used in specs
Dir["#{File.dirname(__FILE__)}/models/**/*.rb"].each {|f| require f}


# Database configuration is performed by running

RSpec.configure do |config|
  config.before(:suite) do
    FileUtils.rm_rf Neo4j::Config[:storage_path]
    ActiveRecord::Base.establish_connection(
      "adapter" => "sqlite3",
      "database"  => "#{File.dirname(__FILE__)}/spec.db"
    )
  end
end

def post(post)
  {
    :first_post => Post.find(1),
    :second_post => Post.find(2)
  }[post]
end

