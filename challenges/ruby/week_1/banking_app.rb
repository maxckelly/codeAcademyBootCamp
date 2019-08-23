# The initial balance should be 0. Show this on screen when the app runs.
balance = 0
transaction = []
user = [
    {

    }
]

p "What's your password?"
password = gets.strip
if password == "password123" # Ask the user for a password before proceeding
    # Wrap the program in a loop so the user can view balance and then deposit over and over.
    loop do 
        system("clear")
        p "Access granted!"
        p "Please select one of the following options Balance, Deposit, Withdraw, History or type restart to restart the app"
        print "> "

        user_input = gets.chomp.to_s.capitalize # Let the user determine the output. Ask them what they would like to do. If they type balance and hit return, show them their balance! Currently the only option is balance.

        if (user_input == "Balance") 
            system("clear")
            puts "Here is your balance: #{balance}"
        elsif (user_input == "Deposit")
            # Add 'deposit' as an option. If they select it, ask 'how much would you like to deposit?'. Update the balance and show it back to the user.
            p "How much would you like to deposit?"
            print "> "
            deposit_input = gets.chomp.to_i 
            balance += deposit_input
            system("clear") # The screen's looking pretty ugly, figure out how to clear the screen between loops.
            p "Your updated Balance is: #{balance}"
            transaction.push "Deposited #{deposit_input}" # Research arrays. Store each transaction in an array and then implement a 'history' option.
        elsif (user_input == "Withdraw")
            loop do 
                p "Your current balance is: #{balance}, How much would you like to withdraw?"
                print "> "
                withdraw_amount = gets.chomp.to_i

                if (withdraw_amount <= balance) # Implement a withdraw feature. Make sure they can't withdraw more than their total balance.
                    balance = balance - withdraw_amount
                    system("clear")
                    p "Your updated balance is #{balance}"
                    transaction.push "Withdrew #{withdraw_amount}" # Research arrays. Store each transaction in an array and then implement a 'history' option.
                    break
                else (withdraw_amount > balance)
                    p "You don't have the mulla"
                end
            end
        elsif (user_input == "History")
            system("clear")
            puts "Here is your history: #{transaction}"
        elsif (user_input == "Restart")  # Restarting the app sets the balance to $0
            balance = 0
            transaction = []
            system("clear")
            puts "You have restarted! Your balance is now #{balance} and your history is: empty"
        elsif (user_input == "End")
            break
        else () # If the user types anything other than balance, say "Invalid selection!"
            system("clear") # The screen's looking pretty ugly, figure out how to clear the screen between loops.
            puts "Invalid Selection!"
        end

        user = { 
            deposit: balance,
            transaction: transaction
        } # Research hashes. Store multiple user balances and histories in a hash.
    end
else 
    system("clear")
    puts "Incorrect password"
end

# Research reading/writing files. Store the balance in a text file so it persists.
