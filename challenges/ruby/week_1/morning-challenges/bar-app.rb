# you are working at a bar where you have a current backlog of drinks to make:
#  3 party parrot cocktails
# 2 party parrot waters
# and
# 6 party parrot beers

# write a program that asks the customer for their order.
drinks = [
    cocktail = 3,
    beers = 2,
    waters = 6
]

total = drinks

p "Hi, What drink would you like to order? - Cocktail, Water or a Beer?"
print "> "
order = gets.chomp.capitalize.to_s

p "Okay how many #{order}s would you like?"
print "> "
quantity = gets.chomp.to_i


if (order == "Cocktail")
    drinks[0] += quantity 
    puts "Okay an order for #{drinks[0]} cocktails are on the way"
elsif (order == "Beer")
    drinks[1] += quantity
    puts "Okay an order for #{drinks[1]} beers are on the way"
elsif (order == "Waters")
    drinks[2] += quantity
    puts "Okay an order for #{drinks[2]} waters are on the way"
else 
    puts "Sorry we don't have that drink"
end

p "Okay, we have to make #{drinks[0]} Cocktails, #{drinks[1]} Beers, #{drinks[2]} waters"



# cocktails sell for $22, and cost $8 to make
# beer sell for $12, and cost $3 to pour
# water sell for $6, and cost $0.15 to make

# print out the total profit for the orders you have