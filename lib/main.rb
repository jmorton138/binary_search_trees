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
array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(array)
pretty_print(tree.root)




