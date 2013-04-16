# Create a student class with buckets corresponding to name and section
# Create code that replaces the attr_accessor line
# Create an instance of the student class and fill both the name and student buckets

# Possible solution:

# class student
#   def name=(name_input)
#     @name = name_input
#   end

#   def name
#     return @name
#   end

#   def section=(section_input)
#     @section = section_input
#   end

#   def section
#     return @section
#   end
# end

# student1 = Student.new
# student1.name = "Raghu"
# student1.section = "AM"

# puts student1.inspect










# Q: Why might you use a instance of a class instead of just using a hash
# A: You can use classes to group similar obects together. If you have 20 hashes that each have student information, there is no way to group them together other than putting them into an array. Creating a class creates a natural and semantic grouping of a collection of objects. In addition, using classes will let you call methods on instances of that class. You cannot call an introduce method that presents formatted information on a hash of student info, but you can call that method on a student object.














# create a user class and fill it with buckets that correspond to useful information
# maybe use name, email, phone, address...
# create a new instance of the user class and save it into a variable called user1
# if you finish early, fill up your buckets with specific information for user1



# Possible solution:

# class User
#   attr_accessor :name, :email, :rank, :foursquare
# end

# user1 = User.new
# user1.name=("Bill")
# user1.email= "bill@bob.com"
# user1.rank = "403"

# puts user1.name

# p user1











# Create a class for a car, fill it up with any relevant information (wheels, make, model?), also create one method that would make sense for a car class




# Possible solution:

# class Car
#   attr_accessor :wheels, :make, :year, :model, :miles

#   def year_and_miles
#     puts "Your car is a #{self.make} #{self.model}, is a #{self.year} and has #{self.miles} miles on it"
#   end
# end

# dodge = Car.new
# dodge.wheels = "stock"
# dodge.make = "Dodge"
# dodge.year = "2011"
# dodge.miles = "30,000"
# dodge.model = "Ram 1500"

# puts dodge.year_and_miles










# create a class for a band, create relevant instance variables, and create at least one method for the class.
# create an instance of the class and call your method on that instance

# class Band
#   attr_accessor :name, :members, :genre, :hometown

#   def open_show(city)
#     puts "Hello #{city}! We're #{name}. Are you ready to rock!!!!!"
#   end
# end

# band1 = Band.new
# band1.name = "Wilco"
# band1.members = ["Jeff Tweedy", "Other people"]
# band1.genre = "folk/indie/rock?"
# band1.hometown = "Chicago"

# band1.open_show("New York")










# Create a class called ShoppingCart. Create relevant instance varaibles, but make sure you include an instance variable called @items, which is an array of items.
# Create a method that fills up the @items array
# Create a method that prints out everything in your cart
# Create any other relevant methods for a shopping cart object

# possible solution

# class ShoppingCart
#   attr_accessor :username, :items
#   def add_item(item_hash)
#     if @items == nil
#       @items = []
#       @items << item_hash
#     else
#       @items << item_hash
#     end
#   end

#   def clear_cart
#     self.items = nil
#   end

#   def print_cart
#     if @items == nil
#       puts "Your cart is empty"
#     else
#       puts "Your cart includes:"
#       puts "-------------------"
#       @items.each do |item|
#         puts "#{item['name']}: #{item['price']} dollars"
#       end
#     end
#   end
# end

# s = ShoppingCart.new
# s.username = "Arjun"
# s.add_item({'name' => 'toothpase', 'price' => 2})
# s.add_item({'name' => 'banana', 'price' => 0.3})

# s.print_cart
# s.clear_cart
# s.print_cart











# Create a class that is relevant to your app idea. Create relevant instance variables. Create at least 3 methods that might be useful for your class. Try to use if/else statments, and loops if possible

























# Challenge: create a method that draws a house in terminal

# Sample output:

#                       x
#                     x   x
#                   x       x
#                 x           x
#               x               x
#             x                   x
#           x                       x
#         x                           x
#       x                               x
#     x                                   x
#   x                                       x
# x x x x x x x x x x x x x x x x x x x x x x x
# x                                           x
# x                                           x
# x                                           x
# x                                           x
# x                                           x
# x                                           x
# x                                           x
# x                                           x
# x                                           x
# x                                           x
# x x x x x x x x x x x x x x x x x x x x x x x





# Possible (crude) solution:

# num = 12
# (num*2 - 1).times do |row|
#   (num*2 - 1).times do |column|
#     if column == (num - row - 1) || column == (num + row - 1)
#       print "x "
#     elsif row == (num - 1)
#       print "x "
#     elsif row > (num - 1) && (column == 0 || column == 2 * (num -1))
#       print "x "
#     elsif row == 2 * (num - 1)
#       print "x "
#     else
#       print "  "
#     end
#   end
#   puts
# end



