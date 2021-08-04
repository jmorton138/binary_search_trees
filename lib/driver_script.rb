require './lib/node.rb'
require './lib/tree.rb'
require './lib/main.rb'


tree = Tree.new(Array.new(15) { rand(1..100) })
puts "balanced? #{balanced?(tree.root)}"
#balanced?(tree.root)
puts "level order"
level_order(tree.root)
puts ""
puts "pre order"
pre_order(tree.root)
puts ""
puts "post order"
postorder(tree.root)
puts ""
puts "in order"
inorder(tree.root)
puts ""
puts "insert 3 values to unbalance BST"
insert(tree.root, 103)
insert(tree.root, 104)
insert(tree.root, 110)
puts "balanced? #{balanced?(tree.root)}"
puts "rebalance tree with inserted values"
tree = rebalance(tree.root)
puts ""
puts "balanced? #{balanced?(tree.root)}"
puts "level order"
level_order(tree.root)
puts ""
puts "pre order"
pre_order(tree.root)
puts ""
puts "post order"
postorder(tree.root)
puts ""
puts "in order"
inorder(tree.root)
puts ""