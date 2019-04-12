# https://projecteuler.net/problem=22
require 'pry'
require './lib/timer.rb'
timer = Timer.new 
timer.start_timer

# import names and set to 'names' array
file_string = IO.read("./22_names.txt")
names = file_string.split(",")
names.sort!

# create 'base26' hash
alpha = ('A'..'Z').to_a
base26 = {} 
alpha.each_with_index do |letter, index|
  base26[letter] = index + 1
end

# evaluate and output answer 
total_sum = 0 
names.each_with_index do |name, name_index|
    letter_values = []
    letters = name.split("")
    letters.each do |letter| 
      letter_values.push(base26[letter])
    end
    total_sum += letter_values.reduce(:+) * (name_index + 1)
end
puts "Total: #{total_sum}"

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 52.73 milliseconds.
