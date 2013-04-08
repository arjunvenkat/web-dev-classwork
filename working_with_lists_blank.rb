#################################
# Automating repetition
#################################

# .times is a way to loop in Ruby.
# This is how you print "howdy" five times:

# 5.times do
#   puts 'howdy'
# end


# Everything that comes between the 'do' and 'end' gets repeated 5 times.

# Try it yourself.

# Challenge: Print the following.
#  howdy 0
#  howdy 1
#  howdy 2
#  howdy 3
#  howdy 4
# using the .times method. Try adding to the code above.








# Hint: Try creating a placeholder variable and changing it each time through to keep track of where you are.

# Your code goes here:














# Continued below...














# Like most patterns that happen often, Ruby gives us a way to clean
# this up a bit. It happens often that you use .times and want to know
# which round you are in, so you can just use this syntax instead:

# 5.times do |this_round|
#   puts "howdy #{this_round}"
# end

# It's just a neater way of keeping track of which round we're in. Just as before, you can name the placeholder variable anything you want. The way the .times method works is that if you choose a variable name between the pipes, it will assign to it the round number each time through.

# Challenge: Try printing the squares of the numbers 0-9.
# Your output should look like this:
#  0
#  1
#  4
#  9
#  16
#  25
#  36
#  49
#  64
#  81

# Your code goes here:














# Continued below...














#################################
# Lists of things
#################################

# Lets say I want to make a list to help me learn names.
# Suppose we want to build an app that helps us learn names. We have an array called 'names'.

names = ["Neal", "Mike", "Jeff", "Raghu"]


# Challenge: Using the .times method, print each element in the names array.
# Your output should look like this:

# *** Neal ***
# *** Mike ***
# *** Jeff ***
# *** Raghu ***



# Your code goes here:














# Continued below...








# Does your solution work if we add a name to the list? If not, try using the .length method to make it smarter.
















# Look! It's a pattern that probably happens often: looping through an array. As you would expect, this happens often, so Ruby gives us a way to clean it up a bit:

# The Array#each_index method will count the length of the array for you, so you don't have to mess around with Array#length and Fixnum#times.

# names.each_index do |i|
#   puts "*** #{names[i]} ***"
# end


# But there's a way to clean it up even more. The .each method will count the length of the array for you, AND it will give you back each element without you needing to manually access the array.

# names.each do |student|
#   puts "*** #{student} ***"
# end

# Notice I named the block variable descriptively; before it made sense to call it 'i' because each time through, it was the index that got assigned to it (because that's what .each_index hands back each time through). This time I get the actual object in the cell (because that's what .each hands back each time through), so I called it 'student'.


# What about hometowns? Let's use our other kind of list, hashes, to keep track of this info:

student1 = { "first" => "neal", "last" => "sales-griffin", "hometown" => "chicago" }
student2 = { "first" => "mike", "last" => "mcgee", "hometown" => "freeport" }
student3 = { "first" => "jeff", "last" => "cohen", "hometown" => "skokie" }
student4 = { "first" => "raghu", "last" => "betina", "hometown" => "goshen" }

# Create an array of students.

students = [student1, student2, student3, student4]

# How would you access Jeff's hometown using the students array?




# Your code goes here:














# Continued below...









# Challenge: Automate the task of displaying the students' names along with their hometowns. Your output should look like this:

#  Neal Sales-griffin is from Chicago.
#  Mike Mcgee is from Freeport.
#  Jeff Cohen is from Skokie.
#  Raghu Betina is from Goshen.


















# Solution below.


















# students.each do |student_hash|
#   puts "#{student_hash["first"].capitalize} #{student_hash["last"].capitalize} is from #{student_hash["hometown"].capitalize}."
# end




# Hard Challenge: Based on the data stored in the shopping_cart, sales_tax, and params variables below, write code that prints out the customer's total, including estimated sales tax, based on the shipping address they entered. Your code should work even if the values of the data change.

# Your output should look like this:
#  Your total with tax is $4455.54.

shopping_cart = [
  {'name' => "iPad 2", 'price' => 499, 'quantity' => 2},
  {'name' => "iMac 27", 'price' => 1699, 'quantity' => 1},
  {'name' => "MacBook Air 13", 'price' => 1299, 'quantity' => 1}
  ]

sales_tax = {"IL" => 0.115, "IN" => 0.09, "MI" => 0.06, "WI" => 0.056}

params = {
  'name' => "Patrick McProgrammerson",
  'address1' => "222 W. Merchandise Mart Plaza",
  'address2' => "12th Floor",
  'city' => "Chicago",
  'state' => "IL",
  'zip' => "60654"
  }


# Hint: First try doing it yourself by hand, and notice the steps you are taking. You will have to translate these instructions into Ruby.


# Now change the value of the key 'state' in the params hash to "WI" and run your code again.
# Your output should look like this:
#  Your total with tax is $4219.776.


# Encapsulate your code in a method if you haven't already. The method should accept a cart array, a tax hash, and a customer hash as arguments.

def print_total(cart_array, tax_hash, customer_hash)
  # Your code here.
end


# Now change the quantity of iMacs to 3 and run your method.
