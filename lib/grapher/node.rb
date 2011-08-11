module Grapher
  class Node
    def self.model_to_node(model)
      Object.const_set(model.to_s + "Node", Neo4j::Rails::Model)
    end
  end
end
