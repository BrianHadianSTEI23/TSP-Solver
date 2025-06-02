class Node
  attr_accessor :name, :to_expand, :path, :all_expanded, :value
  attr_reader :dictionary

  @@final_nodes = {}

  def initialize(name, to_expand, path, all_expanded, value, dictionary)
    @name = name
    @to_expand = to_expand.dup
    @path = path
    @all_expanded = all_expanded
    @value = value
    @@dictionary = dictionary
  end

  def get_final_nodes
    @@final_nodes
  end

  # expand node
  def expand(adjacency_matrix, source_node)
    if @to_expand.empty?
      # calculate the value to go back to initial node
      @all_expanded = true
      @value += adjacency_matrix[@@dictionary[@name]][@@dictionary[source_node]]
      @path << "->#{source_node}"
      @@final_nodes[@path] = @value
    else
      @to_expand.each do |node_to_expand, order|
        # create new node and go recursive
        new_path = "#{@path}->#{node_to_expand}"
        new_value = @value + adjacency_matrix[@@dictionary[@name]][@@dictionary[node_to_expand]]
        new_to_expand = @to_expand.dup
        new_to_expand.delete(node_to_expand)
        new_all_expanded = false
        if new_to_expand.empty?
            new_all_expanded = true
        end
        new_node = Node.new(node_to_expand, new_to_expand, new_path, new_all_expanded, new_value, @@dictionary)
        new_node.expand(adjacency_matrix, source_node)
      end
    end
  end

end
