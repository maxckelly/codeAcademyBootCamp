## Morning Challenge

# Create a method that will take a single string as input, and will return an ordered array containing the index of all capital letters. Return an empty array if no capitals are found. There may be some special characters included
# E.g. capital_index("rABbiT") -> [1, 2, 5]
# E.g. capital_index("lowercase") -> [ ]
# E.g. capital_index("HELLo!"] -> [0, 1, 2, 3]

def capital_index

  user_input = gets.chomp.to_s

  input_array = []
  input_array << user_input.split(//) 

  input_array.each_with_index do |input, index|
    if input.upcase
      puts index
    else
      puts input
    end
  end

end

capital_index()