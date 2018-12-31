# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
require 'prime'

n = 600851475143
primes = []
Prime.each(100000000) do |p| primes.push(p) end 
primes.reverse!

primes.each { |j|
    if n % j == 0
        puts j
        break
    end
}