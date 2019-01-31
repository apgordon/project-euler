class Timer 
    def start_timer 
        @start_time = Time.now
    end 
    
    def stop_timer
        @end_time = Time.now
    end 
    
    def calculate_duration
        puts "Duration: #{((@end_time - @start_time) * 1000).round(2)} milliseconds."
    end 
end 