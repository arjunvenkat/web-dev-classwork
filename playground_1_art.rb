# Warm up:
# Use the size input from the user to print out a straight line

# puts '-' * size




# Problem 1:

# use the size input from the user to print out a triangle in terminal
# example output

# puts "Enter a number for your shape size"
# size = gets.chomp.to_i



#
##
###
####
#####
######
#######

# possible strategies:
# a while loop, using a counter that decrements every step
# use size.times and give it a block of code

# use .times or .each_index or .each
# add another character to my output each iteration through the loop



# one possible solution:
# size.times do |count|
#   puts "#" * (count + 1)
# end

# another possible solution:
# size.times do |count|
#   count = count + 1
#   puts "#" * count
# end












# Problem 2:

# use the size input from the user to print out a triangle in terminal
# example output:

########
#######
######
####
###
##
#

# possible solutions:

# size.times do |count|
#   size = size -1
#   puts "#" * size
# end

# size.times do |count|
#   puts "#" * (size - count)
# end

# size.downto(1) do |count|
#   puts "#" * count
# end

# size.downto(1) { |count| puts "#" * count }














# Problem 3:

# sample output:

       #
      ##
     ###
    ####
   #####
 #######
########


# possible solutions

# size.times do |count|
#   print " " * (size - count)
#   print "#" * (count + 1)
#   puts
# end

















# Problem 4:

# sample output

########
 #######
   #####
    ####
     ###
      ##
       #

# size.times do |count|
#   print " " * (count)
#   print "#" * (size - count)
#   puts
# end











# Problem 5:

# have the user enter their name and use it to create a triangle
# sample output:

# a
# rr
# jjj
# uuuu
# nnnnn

# vvvvvvv
# eeeeeeee
# nnnnnnnnn
# kkkkkkkkkk
# aaaaaaaaaaa
# tttttttttttt
# aaaaaaaaaaaaa
# ssssssssssssss
# wwwwwwwwwwwwwww
# aaaaaaaaaaaaaaaa
# mmmmmmmmmmmmmmmmm
# yyyyyyyyyyyyyyyyyy

# Process:
# - I have to take in a string from a user
# - I need to loop through the string, but I can loop through strings
# - I can loop through arrays, so maybe I can convert my string into an array
# - I google 'ruby convert string to array' and find about the .split method
# - I google 'ruby string' to get to the the string class in the ruby docs
# - I find out about .split(//), which sovles my problem
# - I loop through my array of letters with .each and use a counter to keep track of what loop I'm on

# puts "Enter your name:"
# name = gets.chomp
# letter_array = name.split(//)

# # count = 1
# # letter_array.each do |letter|
# #   puts letter * count
# #   count += 1
# # end



# - I use each_with_index so I dont need to create a counter

# puts "Enter your name:"
# name = gets.chomp
# letter_array = name.split(//)

# letter_array.each_with_index do |letter, index|
#   puts letter * (index + 1)
# end



# Other possible solutions:

# puts "Enter your name: "
# name = gets.chomp

# name.length.times do |x|
#   puts name[x] * (x + 1)
# end



# print 'Enter your name: '
# counter = 1
# input = gets.chomp
# input.each_char do |letter|
#   if counter <= input.length
#     puts letter * counter
#     counter += 1
#   end
# end














# Challenge Problems

# Print out a square block from 1 - 100
# sample output:
#
# 1 2 3 4 5 6 7 8 9 10
# 11 12 13 14 15 16 17 18 19 20
# 21 22 23 24 25 26 27 28 29 30
# 31 32 33 34 35 36 37 38 39 40
# 41 42 43 44 45 46 47 48 49 50
# 51 52 53 54 55 56 57 58 59 60
# 61 62 63 64 65 66 67 68 69 70
# 71 72 73 74 75 76 77 78 79 80
# 81 82 83 84 85 86 87 88 89 90
# 91 92 93 94 95 96 97 98 99 100





# Print out a large x
# sample output:
#
# x                   x
#   x               x
#     x           x
#       x       x
#         x   x
#           x
#         x   x
#       x       x
#     x           x
#   x               x
# x                   x
#
