# Widget Data Challenge

# In this challenge, use the core Ruby File library https://ruby-doc.org/core-2.5.1/File.html (not the CSV library) to manipulate csv data.

# Download the following files and save them to your project directory...
# - widget data file (widget-data-in.csv).
# - Widget class definition (widget.rb).

# Open widget-data-in.csv in append mode and append the following string to the data file (note the carriage return character)...
# widget101,stupendous,99,2,13,5,3.5\n
require_relative "widget-resources/widget.rb"
WIDGET_DATA_FILE = "widget-resources/widget-data-in.csv"

File.open(WIDGET_DATA_FILE, "a") do |line|
    line << "widget101,stupendous,99,2,13,5,3.5\n"
end


# Open widget-data-in.csv in read mode and do the following...
# - read the column headers into an array of strings.
# - read the column values into an array of strings.

arr_header = []
arr_values = []

File.open(WIDGET_DATA_FILE,"r").each_with_index do |line,index|
    if index == 0
        arr_header << line
    else
        arr_values << line
    end
end

# p arr_header
# p arr_values

# Create an array of widget objects from the collected data.

id_arr = []
arr_test = arr_values.map do |widget|
    widget_obj = widget.to_s.split(",")
    widget_class = Widget.new(widget_obj[0],widget_obj[1],widget_obj[2],widget_obj[3],widget_obj[4],widget_obj[5],widget_obj[6])
    id_arr << widget_class
end

# Print the instance count of widgets.

# p Widget.instance_count

# Print the array of widgets.

# p arr_test

# Set the id of each widget object - this should be unique, starting at 1, in increments of 1.


p id_arr[0].id
counter = 0
until counter == id_arr.length
    id_arr[counter].id = counter + 1
    counter += 1
end

pp id_arr


# Open a new file called widget-data-out.csv in write mode, and save the data from each widget object, including the new header.

# WIDGET_DATA_OUT = File.new("widget-data-out.csv", "w")
#     WIDGET_DATA_OUT.puts (id)
# WIDGET_DATA_OUT.close

# File.open(WIDGET_DATA_OUT, "w") do |line|
#     line << id_arr
# end