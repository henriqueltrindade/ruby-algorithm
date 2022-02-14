# require 'byebug'
# 2) Binary Tree Level Order Traversal
#  Percurso de Ordem de Nível de Árvore Binária

# Descrição
# Em geral, essa abordagem é passar por cada nível de uma determinada árvore binária e 
# adicionar o valor de cada nó a result. Para cada iteração, primeiro criamos um level array
# vazio usado para armazenar os valores dos nós no mesmo nível. Em seguida, adicionamos o valde 
# cada nó ao levelarray e empurramos os nós no próximo nível para queuese houver. No final de cada 
# iteração, enviamos o levelarray para result.

def level_order_1(root)
  result = []
  return result if root.nil?

  queue = []
  queue << root

  until queue.empty?
    level_size = queue.length
    level = []
    level_size.times do
      node = queue.shift
      level << node.val
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result << level
  end

  result
end

# Em geral, essa abordagem é passar por cada nível de uma determinada árvore binária e 
# adicionar o valor valde cada nó a result. Para cada iteração, primeiro criamos um levelarray 
# vazio usado para armazenar os valores dos nós no mesmo nível. Em seguida, adicionamos o valde 
# cada nó ao level array e empurramos os nós no próximo nível para queuese houver. 
# No final de cada iteração, enviamos o levelarray para result.

def level_order_2(root, result = [], level = 0)
  return result unless root

  result << [] if result.length == level
  result[level] << root.val
  level_order_2(root.left, result, level + 1)
  level_order_2(root.right, result, level + 1)
end

# Node de árvore binária (Binary Tree node)
class TreeNode 
	# Definir o accessor and reader of classe TreeNode
	attr_accessor :val, :left, :right
	#  Fazer um nó de árvore 
	def initialize(data) 
		# Definir dados do nó 
		self.val = data
		self.left = nil
		self.right = nil
	end
end

def main()

	# Create Binary Tree
	# -----------------------
  #    1
  #    \
  #     2
  #      \
  #       5
  #      /  \
  #     3    6
  #      \
  #       4
	#  Add element  
  
  root_node = TreeNode.new(1)
  root_node.right = TreeNode.new(2)
  root_node.right.right = TreeNode.new(5)
  root_node.right.right.left = TreeNode.new(3)
  root_node.right.right.right = TreeNode.new(6)
  root_node.right.right.right.right = TreeNode.new(4)

  retorno = level_order_2(root_node)
  print("Para a árvore acima, o percurso de ordem de nível é #{retorno.flatten.join(' -> ')}", "\n")

end

# execute
main()