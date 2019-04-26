# https://projecteuler.net/problem=25
require 'pry'
require './lib/timer'

timer = Timer.new
timer.start_timer

# method to calculate the size of nth Fibonacci number
def fib(n)
  arr = []
  for i in 0..n do
    if i == 0
      arr.push(0)
    elsif i == 1
      arr.push(1)
    else
      arr.push(arr[i-1] + arr[i-2])
    end
  end
  return arr.last.to_s.size
end

# find an n whose size is greater than 1000 digits
guesses = [500]
unless fib(guesses.last) > 1000
  until fib(guesses.last) > 1000
    guesses.push(guesses.last * 2)
  end
end

# use binary search to find an n whose fib(n) equals 1000
guesses = guesses[-2..-1]
under = guesses[0]
over = guesses[1]
until fib(guesses.last) == 1000
  if fib(guesses.last) > 1000
    if fib(guesses[-2]) < 1000
      under = guesses[-2]
    end
    guesses.push((guesses.last + under) / 2)
  elsif fib(guesses.last) < 1000
    if fib(guesses[-2]) > 1000
      over = guesses[-2]
    end
    guesses.push((guesses.last + over) / 2)
  end
end

# find the smallest number where fib(n) equals 1000, then output
until fib(guesses.last) != 1000
  guesses.push(guesses.last - 1)
end
guesses.delete_at(-1)
puts guesses.last

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 211.46 milliseconds.
