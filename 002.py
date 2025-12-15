# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

# Define array for fibs 
# Loop through to add next number
    # Break when latest number is greater than 4M (don't keep)

fibs = [1,2]

# Generate sequence until value exceeds 4,000,000
while True:
    next_fib = fibs[-1] + fibs[-2]
    if next_fib > 4000000:
        break
    fibs.append(next_fib)


even_value_fibs = [] 

# Loop through each and store even-valued terms
for number in fibs: 
    if number % 2 == 0:
        even_value_fibs.append(number)

# Print sum of even-valued terms
print(sum(even_value_fibs))
