

def random_number_generator()
    generate_number = []

    generate_number.each do |random|
        random = rand(1..100)
        generate_number.push(random)
    end
    return generate_number
end

p random_number_generator()


=begin 

A magician on the street is about to start their magic trick. First, they are requesting a number (an Integer) from people on the street. They will then use that number, to chose that many random, whole numbers, between 1 and 100

Create a method for the magician that will generate a list [array] of random, whole numbers from a given integer.

E.g. random_number_generator(5) should return [23,34,1,2,13] ... not the same numbers, but should return 5 of them


Optional Extra...

Can you ensure these numbers will be unique?

=end