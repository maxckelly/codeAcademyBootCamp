# 23.
# Contacts Terminal

# Your challenge is to create a terminal app that has similar functionality to the contacts app on your phones

# Specifications

# a. Let users go to a menu that has 4 different options: view contacts, add contacts, remove contacts and exit. This will require the use of some kind of loop. The loop keeps running until the user selects exit from the menu. Think about how the user will select which action they want to perform. Maybe using an integer to select actions is the best option?

# The code for printing your menu will look something like this

puts "1. View contacts"
puts "2. Add contact"
puts "3. Remove contact"
puts "4. Exit"

contacts = [
  {
    name: "Max",
    number: 0,
    email: "maxckel"
  }
]
p "Would you like to view contacts, add contact or remove a contact?"
print "> "
user_input = gets.chomp

if (user_input == "view contacts")
    puts contacts
  elsif (user_input == "add contacts")
    p "what is the name?"
    print "> "
    name = gets.chomp
    p "what is the number?"
    print "> "
    number = gets.chomp
    p "what is the email?"
    print "> "
    email = gets.chomp
    user = {
      name: name,
      number: number,
      email: email
    }
    contacts.push(user)
  elsif (user_input == "remove")
    p "Who would you like to remove?"
    print "> "
    remove_input = gets.chomp
    for contact in contacts
      if contact == remove_input
        contact.delete()
      end
    end
  else 
    puts "no data"
end

p contacts

# b. View contacts should show all entries in a format similar to the below

# ---------------------------------------
# Harrison Malone +6123445468
# Educator at Coder Academy
# 120 Spencer Street, Melbourne
# ---------------------------------------
# Aaron Mendosa +6100000001
# Educator at Coder Academy
# 120 Spencer Street, Melbourne
# ---------------------------------------

# c. Add should provide prompts for each property of the entry like what is the name? ___ and what is the number? ___

# d. Remove should ask for a name, and if that name is in the phone book then ask the user to confirm the removal. Only remove the entry once the user confirms that they want to remove it!