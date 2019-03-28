require 'pry'
# https://projecteuler.net/problem=18

# set up the array of arrays called "triangle"
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
    unless index == array.size-1
      row.push(nil)
    end
  end 
  index.times do row.push(nil) end 
  triangle.push(row)
end

binding.pry
puts ""
