require 'spec_helper'

describe Grapher::Node do

  context "Grapher::Node.model_to_node" do
    before(:each) { Grapher::Node.model_to_node(Post) }
    
    it "should create proper class" do
      PostNode.class.should == Neo4j::Rails::Model
    end

  end
end
