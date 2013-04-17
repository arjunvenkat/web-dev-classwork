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

# num = 3
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


# Solution explanation:

# If anyone was totally stumped on this, don't stress, this problem goes far past what you'll need to use in class. If you are interested in going off track for a bit, here was my basic process. Be warned, it gets pretty math-y:

# 1. I broke the problem up into three visual sections, the triangle, the walls of the house and the floor.
# 2. I started with the triangle
# 3. I knew that the triangle starts with an 'x' in the middle that moves outward one step at a time.  I made a table showing the horizontal position of the 'x', starting at 0, and relative to the row number, if 0 stands for the topmost row. I also just hardcoded a number to calculate the the height of the triangle, called num. It is 0.5 more than half of the triangle's width, for even numbers.

# if num = 3, then the width is 5.  I start with the smallest possible situation that still contains the basic structure of a house

# row    'x' positions (if 0 is the first position)
###################################################
# 0             2
# 1           1, 3
# 2           0, 4

# I didn't want to hardcode positions, in case I want to dynamically change the size of my triangle, so now I tried to look for a pattern in the numbers. I start out at the middle, then work my way outward.  What is the middle of a triangle with a width of 5? It's the number 3, or our case, 2, since we start at 0.  0 1  2  3  4

# Then how could I relate that key center number of 2 to the position information in row 1? 1 is the same as (2-1) and 3 is the same as (2+1) so I could refine my table as follows:

# row    'x' positions (if 0 is the first position)
###################################################
# 0             2
# 1         (2-1), (2+1)
# 2           0, 4

# Same idea for row 2. 0 is just (2-2) and 4 is just (2+2), so I could refine my table as follows:

# row    'x' positions (if 0 is the first position)
###################################################
# 0             2
# 1         (2-1), (2+1)
# 2         (2-2), (2+2)

# Now your class instincts should kick in.  2 is getting repeated on every line here.  We can DRY this up.  In math, the idea of abstraction is similar to DRY in programming.  We just take a common pattern and combine variables to create a statement that refers to an entire pattern.  We can start doing that here.

# row    'x' positions (if 0 is the first position)
###################################################
# 0             center_num
# 1         (center_num - 1), (center_num + 1)
# 2         (center_num - 2), (center_num + 2)

# we're also repeating the 1 and 2, let's fix that

# row    'x' positions (if 0 is the first position)
###################################################
# 0             center_num
# 1         (center_num - row), (center_num + row)
# 2         (center_num - row), (center_num + row)

# center_num isn't a key variable from our script, so maybe we can calculate center_num from our original starting variable of num.  If num is 3, then center_num is 2.  If num is 6 then center_num is 5. We can just dynamically calculate center_num using num and revise our table again

# row    'x' positions (if 0 is the first position)
###################################################
# 0             num -1
# 1         (num - 1  - row), (num - 1 + row)
# 2         (num - 1 - row), (num - 1 + row)

# This looks sort of weird, though, since the row variable is missing from the formula in row 0. Interestingly enough, though, the row variable is just 0, so we can easily add it in and keep the values the same.

# row    'x' positions (if 0 is the first position)
###################################################
# 0             (num - 1 - row)
# 1         (num - 1  - row), (num - 1 + row)
# 2         (num - 1 - row), (num - 1 + row)

# We also have two formulas in every row but row 0, but we can fix that as well

# row    'x' positions (if 0 is the first position)
###################################################
# 0         (num - 1 - row), (num - 1 + row)   # both of these evaluate to the same number, so we're good
# 1         (num - 1  - row), (num - 1 + row)
# 2         (num - 1 - row), (num - 1 + row)

# at this point, i can abstract out an expression for the horizontal positions of the 'x' characters based on the original num variable and the current row:
# (num - 1 - row) or (num - 1 + row)


# Next I want to check every single position on a grid that's defined by size, then use my rule to print either an 'x' or a space. I can start by creating some code that runs through every single position on a grid that overlays the house. I want the size of the triangle to be doubled for the height of the entire house. I can use a nested loop to solve this problem.  One loop moves horizontally and one loop moves vertically. We take care of two dimensions:

# (num * 2 - 1).times do |row|
#   (num * 2 - 1).times do |column|

#    end
# end

# I want the entire size of the house to be double the triangle size, but I don't want to double count the bottom row of the triangle/top side of the rectangle. To avoid this, I'll subtract one from double the triangle height.

# (num * 2 - 1).times do |row|
#   (num * 2 - 1).times do |column|

#    end
# end

# This code will run through every single coordinate on the (x,y) coordinate grid that overlays the house. I can print a character at each position just to check:

# (num * 2 - 1).times do |row|
#   (num * 2 - 1).times do |column|
#      print 'x'
#    end
#    puts
# end

# The print command prints an x without creating a new line. The puts command creates a new line at the end of the inner loop.

# Instead of printing an 'x' at every position, I'll start by using my triangle rule to print an 'x' if the rule applies and a ' ' if the rule doesn't apply. Just in case you forgot about num, I'll include that at the top of the script as well:

# num = 3
# (num * 2 - 1).times do |row|
#   (num * 2 - 1).times do |column|
#     if column == (num - 1 - row) || column == (num - 1 + row)
#       print 'x'
#     else
#       print ' '
#     end
#   end
#   puts
# end

# The rule is checking whether column, which stands for the horizontal position fits either of our two formulas.  The || allows the statement to return true if either the left side of || or the right side of || evaluates to true.

# This looks a bit scrunched up, though, so I'll change 'x' to 'x ' and ' ' to '  '

# num = 3
# (num * 2 - 1).times do |row|
#   (num * 2 - 1).times do |column|
#     if column == (num - 1 - row) || column == (num - 1 + row)
#       print 'x '
#     else
#       print '  '
#     end
#   end
#   puts
# end


# That should get you most of the triangle, let me know if anything's still fuzzy with the rest of it.


