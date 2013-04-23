# Basic toolbox

# Ask a user for a response based on preselected options
# puts "Enter your gender"
# puts "a) female"
# puts "b) male"
# response = gets.chomp.downcase
# if response.eql?('a') || response.eql?('female')
#   gender = "female"
#   puts "Ok, so you're #{gender}."
# elsif response.eql?('b') || response.eql?('male')
#   gender = "male"
#   puts "Ok, so you're #{gender}."
# else
#   puts "... I didn't get that"
# end


# Give a user two different responses depending on what a user types in

# puts "How are you feeling?"
# response = gets.chomp.downcase
# if response == "good" || response == "great"
#   puts "That's awesome"
# else
#   puts "Oh, bummer"
# end




# Ask a user the same question until you get a certain respsonse

# puts "How are you feeling?"
# response = gets.chomp.downcase

# while response != 'good'
#   puts "How are you feeling?"
#   response = gets.chomp.downcase
# end

# puts "Oh that's great"


# Ask a user for a response based on preselected options, and if you don't get an appropriate response, ask them again

# puts "Enter your gender"
# puts "a) female"
# puts "b) male"

# response = gets.chomp.downcase
# while response != 'a' && response != 'b'
#   puts "Are you not certain?.... try again using the letters 'a' or 'b'"
#   response = gets.chomp.downcase
#   if response == 'a'
#     puts "Ok, so you're female."
#   elsif response == 'b'
#     puts "OK so you're male."
#   end
# end





# Give a user a random response from an array

# computer_responses = ['hello', 'hey', "what's up", "yo"]
# puts computer_responses.sample






# Sample chatbot

# puts "Enter your gender"
# puts "a) female"
# puts "b) male"

# response = gets.chomp.downcase
# while response != 'a' && response != 'b'
#   puts "Are you not certain?.... try again using the letters 'a' or 'b'"
#   response = gets.chomp.downcase
#   if response == 'a'
#     puts "Ok, so you're female."
#   elsif response == 'b'
#     puts "OK so you're male."
#   end
# end

# if response == 'a'
#   gender = 'female'
# else
#   gender = 'male'
# end
# puts "Ok, so you're #{gender}"


# puts "So how are you feeling?"
# response = gets.chomp.downcase

# positive_responses = ['good', 'great', 'awesome', 'not bad', 'happy', 'content']
# negative_responses = ['bad', 'not great', 'ugh', 'awful', 'sad', 'depressed', 'anxious']

# emotion = 'neutral'
# positive_responses.each do |p_response|
#     emotion = 'positive' if response.include?(p_response)
# end

# if emotion == 'neutral'
#   negative_responses.each do |n_response|
#       emotion = 'negative' if response.include?(n_response)
#   end
# end

# if emotion == 'negative'
#   puts "Why do you think you feel that way?"
#   response = gets.chomp
#   if gender == 'male'
#     puts "sounds like you have mommy issues"
#   elsif gender == 'female'
#     puts "sounds like you have daddy issues"
#   end
# elsif emotion == 'positive'
#   puts "Awesome!"
# elsif emtion == 'neutral'
#   puts "I see"
# end


























