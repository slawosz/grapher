# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "grapher"
  gem.homepage = "http://github.com/slawosz/grapher"
  gem.license = "MIT"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "slawosz@gmail.com"
  gem.authors = ["Sławosz Sławiński"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "grapher #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Setup Active::Record test database"
task :setup_database do
  require "active_record"

  begin
    ActiveRecord::Migration.drop_table(:posts)
    ActiveRecord::Migration.drop_table(:comments)
  rescue
    nil
  end
  ActiveRecord::Base.establish_connection(
                                          "adapter" => "mysql",
                                          "username" => "root",
                                          "database" => "grapher_development"
                                          )
  
  ActiveRecord::Migration.create_table(:posts) do |t|
    t.string :title
    t.text   :content
    
    t.timestamps
  end

  ActiveRecord::Migration.create_table(:comments) do |t|
    t.text    :content
    t.string  :author
    t.integer :post_id
    
    t.timestamps
  end
  Dir["#{File.dirname(__FILE__)}/spec/models/**/*.rb"].each {|f| require f}
  post1 = Post.create(:title => "First post", :content => "Lorem ipsum")
  post2 = Post.create(:title => "Second post", :content => "Other post")
end
