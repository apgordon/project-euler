require './lib/timer'

timer = Timer.new
timer.start_timer

millionth = (0..9).to_a.permutation.to_a[999_999]
millionth.each_with_index do |digit, index|
  print digit
  puts "" if index == millionth.size - 1
end

timer.stop_timer
timer.calculate_duration

### STATS
# Duration: 3249.43 milliseconds.
