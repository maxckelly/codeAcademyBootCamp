def decimalToBin (num)
  binary = []
  if num == 0 
    puts "please enter a number greater than 0"
  elsif
    while num > 0 
      binary << num % 2
      num /= 2
    end
  end
  binary.reverse.join
end

puts decimalToBin(10);
