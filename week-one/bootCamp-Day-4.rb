# -- Ruby Hashes --
    # A hash always startes with {}
    # A symbol is just an identifier
    # A hash can container arrays, integers, booleans, and other hashes
    # example of a hash is
        # zoo = {
        #     name: 'Melbourne Zoo',
        #     # The key is name and the value is 'Melbourne Zoo' which is a string 
        #     number_of_animals: 3290,
        #     # The key is number_of _animals the value is 3290
        #     kids_welcome: true,
        #     # The key is kids_welcome and the value is true which is a boolean
        #     animals: ['tapir', 'snake', 'butterfly', 'tiger']
        #     # The key is animals and the value is the array of strings
        # }
    # -- Accessing a symbol --
        # To acccess the value of the key you do the below:
            # p zoo[:name]
            # p zoo[:number_of_animals]
            # p zoo[:kids_welcome]
            # p zoo[:animals].sort
            # p zoo[:animals][0]
            # p "Here at #{zoo[:name]} we have #{zoo[:animals]}"
    # -- Updating a hash value --
            # zoo[:name] = "Max"
            # p zoo[:name]
            # zoo[:number_of_animals] += 1000
            # p zoo[:number_of_animals]
            # zoo[:animals] << "Added" #or
            # zoo[:animals].push("Adding using .push")
            # p zoo[:animals]
    # -- A hash in a hash --
        big_animals = {
            size: "tall",
            weight: 100,
            description: "A big boy"
        }
        small_animals = {
            size: "small",
            weight: 5,
            description: "A small boy"   
        }

        zoo = {
            name: 'Melbourne Zoo', 
            number_of_animals: 3290,
            kids_welcome: true,
            animals: ['tapir', 'snake', 'butterfly', 'tiger'],
            description: [big_animals, small_animals ]
        }
        
        # puts zoo[:description][1][:size]
    # -- How to create a new key -- 
        
        zoo[:id] = 001
        p zoo