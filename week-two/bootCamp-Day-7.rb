# -- Coercion -- 
    # This means that you're converting varibles/data to a boolean value
    # From any data type in ruby to a boolean - true or false
# -- Classes -- 
    # Think of a class as a blueprint for a house or a template for an object
    # every class has a constructor - the constructor is initialize 
    # Classes have class widescope. However you can't call things from inside the class its private

    # Example One

        # class Widget
        #     def initialize(id, name, description) # The names in the bracket doesn't need to be the same as the @ names 
        #         @id = id
        #         @name = name
        #         @description = description
        #     end

        #     def id # This calls the id individually 
        #         @id
        #     end

        #     def description
        #         @description
        #     end

        #     def description=(description)
        #         @description=description
        #     end
        # end
        
        # widget_1 = Widget.new(1, "widget", "a very useful thing!")
        # puts widget_1.id
        # puts widget_1.description
        # widget_1.description = "I changed the description"
        # puts widget_1.description
    # Example Two

        class Restaurant
            def initialize(name)
                # @name is an instance varible
                @name = name
            end

            # This is called a instance method - This means you can only call it on an instance so for example delhi_streets.print_out_name (array attached to class) 
            def print_out_name 
                 @name
                self # self is the object (restuarant) itself.
            end
        end

        delhi_streets = Restaurant.new("Delhi Streets")
        p delhi_streets.print_out_name
