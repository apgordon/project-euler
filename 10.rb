# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

require 'prime' 

set = Prime.first(150000)
set.keep_if {|j| j < 2000000 }
puts set.reduce(:+)