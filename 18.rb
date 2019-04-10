require 'pry'
require 'pry'
require './lib/timer'
# https://projecteuler.net/problem=18

timer = Timer.new
timer.start_timer

# set up the array of arrays called "triangle", correctly spaced using nils
# flip the triangle over so it's widest on 'top' or at index 0
file = File.open("./18.txt", "r")
arrays = [] 
file.each do |line|
  row = []
  line.delete("\n")
  row = line.split(" ")
  arrays.unshift(row)
end 
arrays.each do |row|
  row.map!{|number| number.to_i}
end 
triangle = [] 
arrays.each_with_index do |array,index|
  row = [] 
  index.times do row.push(nil) end 
  array.each_with_index do |number, index| 
    row.push(number)
    unless index == array.size - 1
      row.push(nil)
    end
  end 
  index.times do row.push(nil) end 
  triangle.push(row)
end

# evaluation... 
sums = []
triangle.each_with_index do |triangle_row, triangle_index| 
  if triangle_index == 0 
    # skip 
  elsif triangle_index == 1
    # for the second to longest row, look row above in the triangle array for the largest, adjacent (diagonally) number. Then sum that and add to the row_array. 
    row_sums = [] 
    triangle_row.each_with_index do |row_value, row_index| 
      unless row_value == nil 
        if triangle[triangle_index - 1][row_index - 1] > triangle[triangle_index - 1][row_index + 1]
          row_sums.push(row_value + triangle[triangle_index - 1][row_index - 1])
        else
          row_sums.push(row_value + triangle[triangle_index - 1][row_index + 1])
        end
      end
    end
    # after doing for all values in a row, add the row_sum to the sums array.
    sums.push(row_sums)
  else 
    # for each row after the second, refer to the sums array to check for which diagonal number is largest. Then, again, add to the row_array and then push that to the end of the sums array. 
    row_sums = [] 
    triangle_row.delete(nil)
    triangle_row.each_with_index do |row_value, row_index| 
      if sums[-1][row_index] > sums[-1][row_index + 1]
        row_sums.push(row_value + sums[-1][row_index])
      else
        row_sums.push(row_value + sums[-1][row_index + 1]) 
      end
    end 
    sums.push(row_sums)
  end 
  
  # after doing for each row, the last array in the sums array will be the value of the maximum sum path. 
  if triangle_index == triangle.size - 1
    puts sums[-1]
  end 
end 

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 0.33 milliseconds.