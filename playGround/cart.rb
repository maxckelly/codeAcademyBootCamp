require 'json'

cart = JSON.parse(File.read("cart.json"))

p cart["data"].first["price"]