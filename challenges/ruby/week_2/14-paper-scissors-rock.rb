 # Specs
# Use a method (or class if you're feeling like a bit of an expert), to create a scissors-paper-rock (SPR) game. 
# 1.


class Game

  def spr
    @spr = ["Scissors", "Paper", "Rock"]
  end

  def game
    
    puts "Type your option in below."
    puts "Scissors, Paper, Rock!"
    print "> "
    user_input = gets.chomp.capitalize
    puts "You selected #{user_input}"

    # sleep(2)
    computer_answers = spr.sample

    if (computer_answers == user_input)
      puts "You both selected the same answer"
    elsif (computer_answers == "Scissors" && user_input == "Paper")
      puts "You lost"
    elsif (computer_answers == "Paper" && user_input == "Rock")
    end
  end
end

game_one = Game.new()
game_one.spr
puts game_one.game



 

# a. The method (or class) will prompt the user for their selection ("scissors", "paper", "rock"), then will randomly select the computers choice, and will print out the result based on the rules of SPR.

# Example

# The user selects "scissors", random computer selection spits out "rock", print "Computer wins with rock!"

# b. After the game, ask the user if they would like to play again. If they select "No" or "N", exit the method (or class), else replay the method (or class) using recursion.