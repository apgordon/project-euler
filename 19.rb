require 'pry'
require 'date'
require './lib/timer.rb'

# https://projecteuler.net/problem=19
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

timer = Timer.new 
timer.start_timer

year = 1901
month = 1
sundays = 0

until year > 2000
  dow = Date.new(year,month,1).wday
  if dow == 0
    sundays += 1
  end

  unless month == 12
    month += 1
  else
    month = 1
    year += 1
  end
end

puts "#{sundays} Sundays"
timer.stop_timer 
timer.calculate_duration

### STATS
# Duration: 1.08 milliseconds.