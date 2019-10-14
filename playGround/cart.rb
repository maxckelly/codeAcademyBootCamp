# require 'json'

# cart = JSON.parse(File.read("cart.json"))

# p cart["data"].first["price"]

def hello
	name = "harrison"
	yield()
	return name
end 

hello() do |hi| 

end