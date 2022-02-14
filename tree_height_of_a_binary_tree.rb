# require 'byebug'
# 1) Tree: Height of a Binary Tree
#  Encontre a altura da árvore binária ()

# Node de árvore binária (Binary Tree node)
class TreeNode 
	# Definir o accessor and reader of classe TreeNode
	attr_accessor :data, :left, :right
	#  Fazer um nó de árvore 
	def initialize(data) 
		# Definir dados do nó 
		self.data = data
		self.left = nil
		self.right = nil
	end
end

class BinaryTree 
	# Definir o accessor and reader of classe BinaryTree
	attr_accessor :root
	def initialize() 
		self.root = nil
	end

	#  Encontre a altura da árvore binária fornecida (Find height of given binary tree)
	def height(node) 
		
		if (node != nil)
			a = self.height(node.left)
			b = self.height(node.right)
			#  Returning a height of largest subtree
			if (a > b) 
				return a + 1
			else
				return b + 1
			end
		else
			return 0
		end
	end

	def to_hash(node)
		tree_h = {}
		if (node != nil)
			node_l = node.left
			node_r = node.right
			node_child = {}
			if node_l != nil
				node_child[:left] = self.to_hash(node_l)
			end
			if node_r != nil
				node_child[:right] = self.to_hash(node_r)
			end
			tree_h[node.data] = node_child
		end
		tree_h
  end


	private 
	

end

def main() 
	#  Create new tree
	tree = BinaryTree.new()
	# Create Binary Tree
	# -----------------------
	#         1
	#        /  \
	#       2    3
	#      /    /  \
	#     4    5    6
	#      \       /
	#       7     8
	#              \
	#               9                    
	#  Add element
	tree.root = TreeNode.new(1)
	tree.root.left = TreeNode.new(2)
	tree.root.right = TreeNode.new(3)
	tree.root.right.right = TreeNode.new(6)
	tree.root.right.left = TreeNode.new(5)
	tree.root.left.left = TreeNode.new(4)
	tree.root.left.left.right = TreeNode.new(7)
	tree.root.right.right.left = TreeNode.new(8)
	tree.root.right.right.left.right = TreeNode.new(9)
	print("Resultado #{tree.height(tree.root)}", "\n")
	print("Resultado hash #{tree.to_hash(tree.root)}", "\n")
end

main()