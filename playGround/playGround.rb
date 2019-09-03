# require 'tty-prompt'
# require 'tty-spinner'
# require 'geocoder'
require 'pry'
require 'amadeus'


# prompt = TTY::Prompt.new

# question = prompt.ask("Whats the question?")
# prompt.yes?("Do you like ruby?")
# puts question

# choices = %w(Melbourne Australia America)
# prompt.multi_select("Please select one of the following options", choices) # This creates a selection of options for the user to select. You can use space bar to select more than one.

# prompt.ask('What is your name?', default: ENV['USER'])

# # Getting an email address and checking if it is valid or not.
# user_email = prompt.ask("Please enter in your email address") do |q|
#     q.validate(/\A\w+@\w+\.\w+\Z/)
#     q.messages[:valid?] = "Invalid email address, please try again" 
# end

# # Getting a password and covering it 
# user_password = prompt.mask("Please enter a password:")

# How to collect a lot of information and create hashes.
# user_info = prompt.collect do 
#     key(:full_name).ask("What is your name?")
#     key(:location).ask("Where are you from?")
# end

# puts user_info

# This creates a spinner animation
# spinner = TTY::Spinner.new("[:spinner] We're spinning the globe ...", format: :spin_2)

# spinner.auto_spin # Automatic animation with default interval

# sleep(5) # Perform task

# spinner.stop('Off you go!') # Stop animation

# results = Geocoder.search("46 Berkeley St Hawthorn, Melbourne, Victoria, Australia")
# # p results
# # p results.first.country

amadeus = Amadeus::Client.new({
  client_id: 'ASn8vbMxRG3BHyBb7wySNjqvfTLPLSMg',
  client_secret: 'aVsbvwqqimo0FSiP'
})

# begin
#   puts amadeus.reference_data.urls.checkin_links.get({ airlineCode: 'BA' })
# rescue Amadeus::ResponseError => error
#   puts error
# end

# p amadeus.reference_data.airlines.get(airlineCodes: 'U2')

# flight_prices =  amadeus.shopping.flight_dates.get(origin: 'MAD', destination: 'MUC')
# p flight_prices.result["data"].first["price"]["total"] # This is how you access the data in the array

london = amadeus.reference_data.locations.get(
  keyword: 'America',
  subType: Amadeus::Location::ANY
)

p london.result["data"][1]


