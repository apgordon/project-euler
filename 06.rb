# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum. 

# Calculate square of sum 
# (1 + 2 + 3 + n ... )^2
@square_of_sum = (1..100).reduce(:+)**2 

# Calculate sum of squares
# 1^2 + 2^2 + 3^2 + n^2 ... 
set = (1..100)
@sum_of_square = 0 
set.each do |j|
    @sum_of_square += j**2
end 

puts @square_of_sum - @sum_of_square
