# -- Review on methods --

    # Example One
        # This is the method 
        def login(user_name, password) # The bracets () are where the arguments are inputted. This can have zero arguments or it can have hundreds. 
            puts "Loging in..."
        end

        # This is calling a method - login
        # Seeing that the method has two arguments you need to put in two agruments
        login("max_ckelly", "password123")

    # Example Two
        def add_two_nums(num1, num2)
            num1 + num2
        end

        num1 = 100
        num2 = 200
        puts add_two_nums(num1, num2) # This puts the numbers 100 & 200 in and then puts them into the method and pluses them together.
# -- More on Classes -- 
        # Instance varibles (These are the varibles in initilize method) these have global scope in the class.
        # Def initialize is just another method!
        # A getter returns data
            # Example: 
            #     def description
            #         @description
            #     end
        # A setter takes and assigns
            #     def description=(description)
            #         @description=description
            #     end
        # Another way to set getter and setters
            # attr_reader :
        # Player has name, health, previous scores. Player can jump
# -- Class Varible -- 
    # a class varible uses @@class_varible = value
    # When you have .self next to the class varible method that only allows you to access it from the class so you can't call it directly e.g. widget_one.class_varible
    # The class varible is initilized across every new instance creating the same value
        # Example
            # class Widget

            #     @@class_varible = "FOO" 
            #     def initialize(id, name, description)
            #         @id = id
            #         @name = name
            #         @description = description     
            #         @@class_varible = "FOO"   
            #     end

            #     def self.class_varible 
            #         @@class_varible
            #     end
            # end

            # widget_one = Widget.new(1, "widget One", "Description 1")
            # p widget_one.class_varible
# -- Inheritance --
    # This means properties coming down the hierarchy 
    # More information on object methods  - https://ruby-doc.org/core-2.5.1/Object.html
    # If you use the method to_s this spits everything out to a string
    # To inherit from a class you do the following: <inheriting class> < <Class you want to inherit>. 
    # A special class requires all the same attributes as the parent attribute 
    # The parent class is the class created first (widget) and the child is the special class with the super (specialWidget)
    # This allows us to access everything in the widget class above
        # class specialWidget < Widget
        #     def initialize(attribute)
        #         @attribute 
        #     end
        # end
        # Example
            class Widget

                @@class_varible = "FOO" 
                def initialize(id, name, description)
                    @id = id
                    @name = name
                    @description = description     
                    @@class_varible = "FOO"   
                end

                def self.class_varible 
                    @@class_varible
                end

                def to_s # This spits it out in a readable and friendly format
                    return "name: " + @name + " id: " + @id.to_s
                end
            end

        # Example of special class
        class SpecialWidget < Widget
            def initialize(id, name, description,attribute)
                super(id, name, description)
                @attribute 
            end
        end

        widget_one = Widget.new(1, "widget One", "Description 1")
        sp_widget = SpecialWidget.new(3, "sp_widget_3", "I am special", "Special value!" )
        puts sp_widget



