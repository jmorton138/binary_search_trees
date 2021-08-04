require './lib/node.rb'
require './lib/tree.rb'


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
        #third case
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
        #third case
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

def level_order(root)
    if root == nil
        return
    end
    queue = []
    array = []
    #save node in Q
    queue << root
    while !queue.empty?() do
        #print data from current node
        current = queue.first()
        #print current.data
        array << current.data
        #save left and right nodes into Q
        if current.left_child != nil
            queue.push(current.left_child)
        end
        if current.right_child != nil
            queue.push(current.right_child)
        end
        #remove first element from array
        queue.shift()
    end
    print array
    return array
    #print node at front of Q and save it's children to Q
end

def inorder(node)
    if node == nil
        return
    end
    inorder(node.left_child)
    print node.data
    print ", "
    inorder(node.right_child)
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

def postorder(node)
    if node == nil
        return
    end
    postorder(node.left_child)
    postorder(node.right_child)
    print node.data
    print ", "
end

def height(node, counter = 0, array = [])
    #returns the number of edges in longest path from a given node to a leaf node.
    if node == nil
        return counter - 1
    end
    counter += 1
    array.push(counter)
    height(node.left_child, counter, array)
    height(node.right_child, counter, array)
    return array.max - 1
end

def depth(root, node, counter = 0)
    if root == nil
        return
    end
    counter += 1
    depth(root.left_child, node, counter)
    depth(root.right_child, node, counter)
    if root.data == node
        p counter - 1
    end
end

def balanced?(root)
    if root == nil
        return
    end
    #compare height difference of each subtree
    #if any height diff is greater than 1 return false
    left_height = height(root.left_child)
    right_height = height(root.right_child)
    diff = left_height - right_height
    if diff.abs > 1
        return false
    else
        return true
    end
end

def rebalance(root)
    # create level order array then pass it into build_array method
    tree = Tree.new(level_order(root))
end


def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
end




