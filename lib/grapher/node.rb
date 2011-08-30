module Grapher
  class Node

    def self.model_to_node(model)
      node_class_name = model.to_s + "Node"
      eval <<-RUBY
        class ::#{node_class_name} < Neo4j::Rails::Model
    class << self
      attr_reader :base_model
    end

          @base_model = #{model}
        end
        RUBY
        klass = node_class_name.constantize
        klass.class_eval do
          model.column_names.each do |column_name|
            property column_name.to_sym
          end
        end

        copy_objects(model, klass)
  end

  private

  def self.copy_objects(ar_class, node_class)
    ar_class.all.each do |ar_object|
      node_class.create!(ar_object.attributes)
    end
  end
end
end
