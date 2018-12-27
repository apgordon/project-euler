# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

@m = 1
@n = 2 
@sum = 0 

def calculate_triple_sum(m,n)
    # Euclid's formula for generating Triplets given integers m and n where m > n > 0 
    a = n**2 - m**2
    b = 2 * n * m
    c = n**2 + m**2
    @sum = a + b + c
    if @sum == 1000
        @a = a
        @b = b 
        @c = c
        puts "#{b}, #{a}, #{c}"
        puts "sum: #{@sum}"
        triple_sum(@a,@b,@c)
    end
end

def triple_sum(a,b,c)
    puts a * b * c 
end

until @sum == 1000
    calculate_triple_sum(@m,@n)
    # While sum is less than 1000, increase n
    if @sum < 1000
        @n += 1
    # Once sum is greater, increase m by 1 and adjust n so it's greater than m
    else 
        @m += 1 
        @n = @m + 1
    end
end
