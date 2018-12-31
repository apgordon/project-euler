# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

n = 20.0 # Set as float so I can evaluate remainder.
all_divisble = false 

until all_divisble == true
    (1..20).each do |j|
        if n % j == 0
            if j == 20
                all_divisble = true
                puts "#{n} is the smallest positive number"
                break
            end 
        else 
            n += 20 # Save some time by incrementing by 20, since must be divisble by 20. 
            break
        end
    end
end
