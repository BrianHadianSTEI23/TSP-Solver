
=begin
algorithm
1. input matriks of adjacency (n x n)
2. insert like the data in the format
3. do calculation of dynamic programming (forward)
4. keep the result and display in the end
=end

require_relative "node.rb"

def main()

    Dir.foreach("../test/input").each do |entry|
        next if entry == "." || entry == ".."
        puts entry
    end
    puts "Enter your problem set:"
    problem_set = STDIN.gets.chomp

    puts "Traveling Salesman Problem Solver"
    targetFile = File.readlines("../test/input/#{problem_set}")
    nodes = []
    adjacency_matrix = []

    # display the problem first
    for line in targetFile
        puts line
    end

    # get the components
    nodes = targetFile[0].split(" ")
    
    # receive input source node
    puts "Type in your home and destination node (must be the same) : "
    source_node = STDIN.gets.chomp
    while Float(source_node, exception:false) || Integer(source_node, exception: false) || nodes.include?(source_node)
        puts "Wrong type. Please try again"
        source_node = STDIN.gets.chomp
    end


    # generate to_expand
    to_expand = {}
    dictionary = {}
    nodes.each_with_index do |node, i|
        dictionary[node] = i
        to_expand[node] = i unless node == source_node
    end

    # get the values of adjacency matrix
    targetFile[1..].each do |line|
        row = line.split.map(&:to_i)
        adjacency_matrix << row
    end

    # generate constructs for all nodes
    main_node = Node.new(
        source_node,
        to_expand, 
        source_node,
        false,
        0,
        dictionary
    )

    # generate solutions
    main_node.expand(adjacency_matrix, source_node)
    
    min = main_node.get_final_nodes[main_node.get_final_nodes.keys.first]
    valid_nodes = []
    main_node.get_final_nodes.values.each do | path_val |
        if min > path_val
            min = path_val
        end
    end
        
    # return those results
    puts "Your ways are : "
    main_node.get_final_nodes.keys.each do | path |
        if main_node.get_final_nodes[path] == min 
            puts "#{path} (#{min})"
        end
    end
end

main()

