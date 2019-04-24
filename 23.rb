# https://projecteuler.net/problem=23
require 'pry'
require './lib/timer'

timer = Timer.new
timer.start_timer

# method to check if number is abundant
def abundant?(n)
  i = 1
  divisors = []
    until i > Math.sqrt(n)
      if n % i == 0
        divisors.push(i)
        unless i == 1
          divisors.push(n/i)
        end
      end
      i += 1
    end
  return true if divisors.uniq.reduce(:+) > n
end

# loop to generate all the abundant numbers, then store in an array called 'abundant_numbers'
i = 12
abundant_numbers = []
until i == 28123
  abundant_numbers.push(i) if abundant?(i)
  i += 1
end

# for the range 1..28123, check if number can be written as sum of two abundant numbers
# if it can't be, store in an array called 'cannot'
cannot = (1..23).to_a
(24..28123).each {|n|
  puts "#{(((n.to_f/28123)*100).round)}% complete" if n % 1000 == 0
  abundant_numbers.each do |abundant_number|
    difference = n - abundant_number
    if difference < 0
      cannot.push(n)
      break
    elsif abundant_numbers.include?(difference)
      break
    elsif abundant_number == abundant_numbers.last
      cannot.push(n)
    end
  end
}

# sum all values in the 'cannot' array
puts cannot.reduce(:+)

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 235815.44 milliseconds.
