#!/usr/bin/env ruby

class Tree
  attr_accessor :children, :node_name

  def initialize(name, val={})
    @node_name = name
    @children = []
    if (val.is_a?(Hash))
      val.keys.each do |key|
        children.push Tree.new(key, val[key])
      end
    elsif (val)
      children.push(Tree.new(val, nil))
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])
ruby_tree = Tree.new("Ruby", {
  "raby": 34,
  "rewad": {
    "342": "test"
    }
  })

puts "visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
