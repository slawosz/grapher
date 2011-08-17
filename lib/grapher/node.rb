module Grapher
  class Node
    def self.model_to_node(model)
      klass = Class.new(Neo4j::Rails::Model)
      Object.const_set(model.to_s + "Node", klass)

      model.column_names.each do |column_name|
        klass.class_eval do
          property column_name.to_sym
        end
      end

      copy_objects(model, klass)
    end

    private
    
    def self.copy_objects(ar_class, node_class)
      ar_class.all.each do |ar_object|
        debugger
        node_class.create!(ar_object.attributes)
      end
    end
  end
end
