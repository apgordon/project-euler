=begin 
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
=end 

require 'pry'
require './lib/timer'
timer = Timer.new
timer.start_timer

set = (1..1000)

ones_teens = {0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

tens = {1 => "ten", 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"} 

sum = 0
set.each do |j|
    
    if j > 999  
        sum += "onethousand".size
        
    elsif j.between?(100,999)
        sum += ones_teens[j.to_s[0].to_i].size
        sum += "hundred".size
        
        # not 100, 200, etc
        unless j.to_s[1] == "0" && j.to_s[2] == "0"
            sum += "and".size
           
           # 120, 125, etc 
            if j.to_s[1].to_i >= 2 
                sum += tens[j.to_s[1].to_i].size
                sum += ones_teens[j.to_s[2].to_i].size
            # 119, 109, etc
            else 
                sum += ones_teens[j.to_s[1..2].to_i].size
            end
        end 
        
    elsif j.between?(20,99)
        sum += tens[j.to_s[0].to_i].size
        sum += ones_teens[j.to_s[1].to_i].size
    
    elsif j.between?(1,19)
        sum += ones_teens[j].size
    end 

end

puts "Total sum is #{sum}."

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 2.88 milliseconds.