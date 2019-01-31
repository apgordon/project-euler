=begin 
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
=end 

require './lib/timer'

timer = Timer.new 

timer.start_timer
a = (2**1000)
digits = []
digits = a.to_s.split("")
digits.map! { |j| j.to_i } 
sum = digits.reduce(:+)
puts sum 
timer.stop_timer
timer.calculate_duration

# STATS 
# Solved in 0.31 ms