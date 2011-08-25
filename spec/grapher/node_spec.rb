require 'spec_helper'

describe Grapher::Node do

  context "Convert ActiveRecord to Neo4j" do
    before(:all) do
      Grapher::Node.model_to_node(Post)
    end
    
    it "should create proper class for neo4j model" do
      PostNode.superclass.should == Neo4j::Rails::Model
    end

    it "should has the same attributes as original model" do
      node_attributes = PostNode.instance_eval {_decl_props}.keys.map(&:to_s).sort
      ar_attributes   = Post.column_names.map.sort

      node_attributes.should == ar_attributes
    end

    it "should has the same data as original model" do
      [:title, :content].each do |attribute|
        ar_posts = Post.all.map(&attribute).sort
        neo4j_posts = PostNode.all.map(&attribute).sort
        neo4j_posts.should == ar_posts
      end
    end

  end
end
