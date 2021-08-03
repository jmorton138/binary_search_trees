# require './lib/node.rb'
# require './lib/tree.rb'
class Node
    attr_accessor :data, :left_child, :right_child

    def initialize(data, left_child = nil, right_child = nil)
        @data = data
        @left_child = left_child
        @right_child = right_child
    end

end

class Tree
    attr_accessor :array, :root
    def initialize(array)
        @array = array.sort.uniq
        @root = build_tree(array)
    end

    def build_tree(array, first = 0, last = array.length - 1)
        #base case
        return nil if first > last
        # 1) Get the Middle of the array and make it root.
        mid = (first + last)/2
        root = array[mid]
        node = Node.new(root)
        # 2) Recursively do same for left half and right half.
        node.left_child = build_tree(array, first, mid - 1)
        node.right_child = build_tree(array, mid + 1, last)
        return node
    end


end
def insert(root, value)
    return root.left_child = Node.new(value) if value < root.data && root.left_child == nil
    return root.right_child = Node.new(value) if value > root.data && root.right_child == nil
    return insert(root.left_child, value) if value < root.data
    return insert(root.right_child, value) if value > root.data 
end

def delete(root, value)

    if root.left_child.data == value
        #first case: deleting leaf in tree
        if root.left_child.left_child == nil && root.left_child.right_child == nil
            root.left_child = nil
            return 
        # second case: node with one child, always point parent to child
        elsif root.left_child.right_child != nil && root.left_child.left_child == nil
             root.left_child = root.left_child.right_child
             return
        #3rd case
        elsif root.left_child.left_child != nil && root.left_child.right_child != nil
            min_root = root.left_child.right_child
            min = find_min(min_root)
            root.left_child.data = min.data
            delete(root.left_child, min.data)
            return
        end
    elsif root.right_child.data == value
        #first case
        if root.right_child.left_child == nil && root.right_child.right_child == nil
            root.right_child = nil
            return
        #second case    
        elsif root.right_child.right_child != nil && root.right_child.left_child == nil
            root.right_child = root.right_child.right_child
            return
        elsif root.right_child.left_child != nil && root.right_child.right_child != nil
            min_root = root.right_child.right_child
            min = find_min(min_root)
            root.right_child.data = min.data
            delete(root.right_child, min.data)
            return
        end
            
    end

    if value < root.data
        delete(root.left_child, value)
    end
    if value > root.data
        delete(root.right_child, value)
    end

end

def find_min(root)
    
    if root.left_child == nil  
        return root
    else
        find_min(root.left_child) 
    end
end

def find(root, value)
    return root if root == nil || root.data == value
    return find(root.left_child, value) if root.data > value
    return find(root.right_child, value) if root.data < value
end



def pre_order(node)
    if node == nil
        return
    end
    print node.data
    print ", "
    pre_order(node.left_child)
    pre_order(node.right_child)
end

def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
end



array = [1, 2, 3, 4, 5, 6, 7]
#array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(array)
#pretty_print(tree.root)
#pre_order(tree.root)
#insert(tree.root, 1.5)
pretty_print(tree.root)
delete(tree.root, 6)
pretty_print(tree.root)


# #2 child nodes
# if root.left_child != nil && root.right_child != nil
#     #find next biggest: min on right (or max on left)
#     #keep going to the right until no left child, this is value to be replaced with deleted value
#     delete(root.right_child, value)
# elsif root.right_child != nil && root.left_child == nil
#     #this is your min value on right
#     min = root.right_child
#     #replace
# end
