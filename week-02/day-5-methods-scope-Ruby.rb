# -- Basic Info of Methods --
    # Methods are a sequents of commands that can be used in a program over and over again
    # Methods helps keep your code DRY - Don't Repeat Yourself 
    # Methods always returns something
    # A method always starts with def
    # To call a method you do <method_name>() 
    # Always return in a method. If you have a puts though in the method it will return nil at the end
    # Once a method see the return line it stops completely

# -- Some example --
    #     def greet
    #         return "Hello"
    #     end

    #     # To call a method you do:
    #     greet()
    #     p greet()

    #     def print_menu 
    #         puts "
    #         press 1 for deposit 
    #         press 2 for deposit 
    #         press 3 for deposit
    #         "
    #     end

    #     print_menu

# -- Methods with arguments --
    # def addition (a, b)
    #     a + b
    # end

    # a way to display it would be: 
    #     p addition(2, 3)
         # or 

    #     result = addition(3, 2)
    #     puts result

    # def division (num1, num2)
    #     num1 / num2
    # end

    # p division(4, 2)

# -- Scope --
    # Example - The below code wouldn't work because the num isn't in the scope
        # Num is in the global scope
        # The only way to pass this num varible into the method scope is through the arguments
        # The my_method has its own scope called the method scope

        # num = 100

        #def my_method
            # method scope
            # return num
        #end

        # my_method()

        # An example of how you would get num into scope is:
        # num = 100 

        # def my_method(num) # the parameter is a placeholder for the argument we pass. So it doesn't have to be the same name. It has no value just represents our argument 
            # return num # Whatever the parameter is is the name you're calling. For example if (num) was called (number100) we would have to change num in method scope
        # end

        # number = my_method(num) 
        # p number # This is now accessible in the Global scope

# Calling a method inside a method
    # Example - Calling a method inside a method 
        # number = my_method(number)

        # def adder(num1, num2)
        #     return num1 + num2
        # end

        # def display_sum()
        #     sum = adder(1, 5)
        #     return sum
        # end

        # p display_sum()