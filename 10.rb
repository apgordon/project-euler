# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

require 'prime' 

# Rough cut to get set of prime numbers up to at least 2 million
set = Prime.first(150000)
# Slim down set so only primes below 2 million are kept 
set.keep_if {|j| j < 2000000 }
# Add through each and print the sum 
puts set.reduce(:+)