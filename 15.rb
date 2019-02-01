=begin 
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=end 

require './lib/timer.rb'

# Binomial Coefficient, factorial formula 
# n! / k!(n-k)!
# n = 40
# k = 20 

def calculate_factorial(n)
    (1..n).reduce(:*)
end 

timer = Timer.new 
timer.start_timer

puts calculate_factorial(40) / (calculate_factorial(20) * calculate_factorial(40-20))

timer.stop_timer 
timer.calculate_duration

# STATS
# Duration: 0.08 milliseconds.