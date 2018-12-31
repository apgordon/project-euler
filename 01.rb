# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

set = (1..999).to_a
multiples_of_3_or_5 = []
set.each { |j|
    if (j % 5 == 0) || (j % 3 == 0)
        multiples_of_3_or_5.push(j)
    end
}
puts multiples_of_3_or_5.reduce(:+)