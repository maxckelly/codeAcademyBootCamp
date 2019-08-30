# A group of friends have just finished lunch. Write method to work out how much each person owes.


# adding_items = []

# puts "Hi! Lets add some items to the menu!"
# puts "Press 1 to add items"
# puts "Press 2 to work out a total"
# print "> "
# user_input = gets.chomp.to_i

# if (user_input == 1)
#     puts "Let's add some items! What items would you like to add?"
# end
# - Your app should ask "Enter a customer's name"- Your first line of code is:

items = [
    {
        customer: "John",
        item: "Soup",
        cost: 8.50
    },
    {
        customer: "Sarah",
        item: "Pasta",
        cost: 12
    },
    {
        customer: "John",
        item: "Coke",
        cost: 2.50
    } 
]

def owing(items)

    amount = []
    name = [:customer]

    for customer in items do
        if (customer == "John")
    end
end

# puts "#{item[:customer]} owes a total of: $#{item[:cost]'%.2f'}"

owing(items) # calling the method


## Beast
# Format your total so it always shows two decimal places, e.g. $11.00
# Allow items to be added to the list. E.g. "Press 1 to add items, press 2 to work out a total".