# https://projecteuler.net/problem=21

require './lib/timer.rb'
timer = Timer.new 
timer.start_timer

# calculates all divisors of n (except itself) and sums
def sum_of_divisors(n)
  i = 1 
  divisors = [] #numbers less than n which divide evenly into n 
    until i > Math.sqrt(n)
      if n % i == 0 
        divisors.push(i)
        unless i == 1
          divisors.push(n/i)
        end
      end
      i += 1
    end 
  divisors.uniq!
  divisors.reduce(:+)
end

amicable = []
x = 10000
until x == 1
  x_sum = sum_of_divisors(x) 
  y_sum = sum_of_divisors(x_sum)
  # condition 1) d(a) = b and d(b) = a, 
  # condition 2) where a != b 
  if y_sum == x && x != x_sum 
    amicable.push(x, x_sum)
  end 
  x -= 1
end 

amicable.uniq!
amicable.sort!
# puts amicable.inspect
puts "Total: #{amicable.reduce(:+)}"

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 157.67 milliseconds.