def decimalToHex (num)
  binary = []
  if num == 0 
    puts "please enter a number greater than 0"
  elsif
    while num > 0 
      binary << num % 8
      num /= 8
    end
  end
  binary.reverse.join
end

puts decimalToHex(11);
