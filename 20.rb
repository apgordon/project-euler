# https://projecteuler.net/problem=20
require 'pry'
require './lib/timer.rb'
timer = Timer.new 
timer.start_timer

range = (1..100)
product = range.reduce(:*)
digits = product.to_s.split("")
digits.map! {|x| x.to_i}
puts digits.reduce(:+)

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 0.33 milliseconds.