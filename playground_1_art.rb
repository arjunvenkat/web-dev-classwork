10.times do |count|
  puts '*' * count
end

10.times do |count|
  print " " * (9 - count)
  print '*' * (count)
  puts
end


10.times do |count|
  puts '*' * (9 - count)
end

10.times do |count|
  print " " * count
  print '*' * (9 - count)
  puts
end

10.times do |count|
  puts "****"
end

10.times do |count|
  print " " * (9 - count)
  print '*' * (count)
  puts
end
