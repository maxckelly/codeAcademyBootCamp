# Specs
# This challenge involves building a continent, country, state and city class
# The end product will be similar to our albums, artists and songs challenge in understanding that a city can be nested inside of a continent object
# 1. Define a continent class. Give this class a couple of attributes, one of which should be countries. This will be an attribute that is an array of country objects. 
# 2. Define a country, state and city class. 

class Continent

  attr_accessor :countries, :states

  def initiazle()
    @countries = []
  end
end

class Country < Continent
  def initiazle()
    @country_name = []

  end
end

class State < Country

end

class City < State
  def initiazle()

  end
end



# 3. Make some objects relating to each class, and assign them to the relevant classes array attribute.

# For some more context

# Countries would be in an array relating to the countries attribute of a continent object. States would be in an array relating to the states attribute of a country object. 