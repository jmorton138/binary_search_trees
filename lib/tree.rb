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