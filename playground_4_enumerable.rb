require './playground_4_announcements_data.rb'
# bonus points if you wrap the code up in methods
# As a developer or user, what would information would you want about this data?



# Are there any announcements written by a particular author?

# ### Sol 1
# result = false
# @announcements.each do |announcement|
#   if announcement[:author] == "Arjun"
#     result = true
#   end
# end
# puts result


# ### Sol 2
# result = @announcements.any? do |announcement|
#   announcement[:author] == "Arjun"
# end
# puts result


# ### Sol 3
# def any_announcements_by(author, announcements_array)
#   announcements_array.any? { |announcement| announcement[:author].include? author }
# end
# puts any_announcements_by('Arjun Venkataswamy', @announcements)







# How many announcements were written by a particular author?

# ### Sol 1
# count = 0
# @announcements.each do |announcement|
#   count +=  1 if announcement[:author].include? "Arvin"
# end
# puts count

# ### Sol 2
# total_announcements = @announcements.inject(0) do |sum, announcement|
#   announcement[:author] == "Arvin" ? sum + 1 : sum
# end
# puts total_announcements


# ### Sol 3
# def announcements_written_by(author, announcements_array)
#   announcements_array.count { |announcement| announcement[:author].include? author }
# end
# puts announcements_written_by('Arvin', @announcements)









# Find if two words are repeated anywhere, possible typos?

# ### Sol 1
# array_of_words = @announcements.first[:text].split

# repeat = false
# array_of_words.each_cons(2) do |two_words|
#   repeat = true if two_words[0] == two_words[1]
# end
# puts repeat









# Pull out all of the posts that were written by a particular person

# ### Sol 1
# filtered_posts = []
# @announcements.each do |announcement|
#   if announcement[:author].include? "Arvin"
#     filtered_posts << announcement
#   end
# end
# puts filtered_posts.count

# ### Sol 2
# name = "Arvin"
# filtered_posts = @announcements.find_all { |announcement| announcement[:author].include? name}
# puts filtered_posts







# Return the exact same array of hashes, with lowercase author names

# ### Sol 1
# filtered_posts = []
# @announcements.each do |announcement|
#   announcement[:author] = announcement[:author].downcase
#   filtered_posts << announcement
# end
# puts filtered_posts

# ### Sol 2
# filtered_posts = @announcements.map do |announcement|
#   announcement[:author]
# end
# puts filtered_posts

















####### Extras


# Check if all of the announcements ae under a certain word length

# ### Sol 1
# result = @announcements.all? do |announcement|
#   announcement[:text].split.count < 200
# end
# puts result






####### Benfords Data Solution

# data1 is faked!

# this solution uses the each method.  See if you can improve it

# If you want to try out the following solution, you must copy in the Benfords data from https://github.com/arjunvenkat/web-dev-classwork/blob/master/playground_4_benfords_data.rb


# def print_digit_counts(number_array)
#   # initializes an empty hash to store counts for each digit
#   digit_counts = Hash.new 0

#   number_array.each do |num|
#     # pulls out the first digit from each number in an array
#     first_digit = num[0].to_i

#     # loops through the numbers 1 - 9
#     1.upto(9).each do |num|
#       # checks to see if the first_digit matches
#       if first_digit == num
#         # increment the key-value pair with a key of num
#         digit_counts[num] += 1
#       end
#     end
#   end

#   1.upto(9).each do |num|
#     # create a base layout for a graph
#     print num.to_s + ' |'
#     # print out bars for each digit
#     print "*" * (digit_counts[num]/10)
#     puts
#   end

#   # calculate percentages for each digit
#   1.upto(9).each do |num|
#     digit_count_decimal = digit_counts[num] * 1.00
#     percent_of_distribution = (100 * digit_count_decimal)/number_array.count
#     puts num.to_s + " is " + percent_of_distribution.to_s + "% of the distribution"
#   end

# end

# print_digit_counts(data1)
# print_digit_counts(data2)


