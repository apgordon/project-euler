# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

# Set initial terms to multiply 
@a = 999
@b = 999 
# Create empty hash to store successful palindromes into
@palindromes = {} 

def check_if_palindrome(a,b) 
    product = (a * b).to_s
    # If the product of a and b is the same backwards and forwards... 
    if product[0..2] == product[3..5].reverse
        # Add it to the palindromes hash
        @palindromes[product] = "#{@a},#{@b}"
    end
end 

def adjust_terms 
    # Reduce @a by 1 and set @b to 1 less than @a to prevent testing the same terms multiple times 
    # 999, 998 
    # 999, 997 
    # 998, 997 
    # 998, 996 
    # 997, 996 and so on... 
    @a -= 1    
    @b = @a - 1 
end 

until @a == 900
# Span variable tells loop how much to reduce @b by before reducing @a
span = 0
    until span == 100
        # check if @a and @b multiplied together results in a palindrome 
        check_if_palindrome(@a,@b)
        @b -= 1 
        span += 1
    end
    adjust_terms

end 

# Determine the largest product, and the terms used
max = @palindromes.max 
puts "#{max[0]} = #{max[1][0..2]} x #{max[1][4..6]}"