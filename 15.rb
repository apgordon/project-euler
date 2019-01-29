=begin 
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=end 


require 'pry'

class Grid
    attr_accessor :width, :height, :x, :y, :finished_paths, :current_path, :finished
    
    def initialize 
        @width = 20
        @height = 20
        @x = 0
        @y = 20
        @finished_paths = 0
        @current_path = []
        @finished = false 
    end
    
    # GO FORWARD METHODS 
    def add_coord_to_current_path(x,y)
        @current_path.push("#{@x},#{@y}")
    end
    
    def move_down 
        @y -= 1
    end 
    
    def move_right
        @x += 1
    end 
    
    def go_to_bottom_right
        # move toward bottom right corner 
        # if possible to go down, do so
        # if not, go right 
        
        add_coord_to_current_path(@x,@y)
        until @x == @width && @y == @height - @width
            if @y > 0
                move_down
            else 
                move_right
            end
            add_coord_to_current_path(@x,@y)
        end 
        @finished_paths += 1
    end 
    
    def tally_finished_paths
        @finished_paths = @finished_paths * 2
        puts "There are #{@finished_paths} total paths."
        @finished = true 
        
    end 
    
    # GO BACKWARD METHODS
    
    def find_next_possible_right
        # starting at the bottom right point, evaluate if possible to go right and be on a new point (not part of the sequence) 
        # once possible, delete from bottom right of sequence to that point 
        # move right 
        
        @current_path.reverse.each_with_index do |coord, index|
            x = coord.split(",")[0].to_i
            y = coord.split(",")[1].to_i
            
            unless index == 0  
                if is_right_possible?(x+1, y, index)
                    if coord == "0,#{@height}"
                        tally_finished_paths
                        break
                    else 
                        @current_path.slice!(-index..-1)
                        @x = x + 1
                        @y = y
                        break
                    end 
                end
            end
        end
    end
    
    def is_right_possible?(x,y,index)
        if "#{x},#{y}" == @current_path[-index] || x > @width
            return false 
        else
            return true 
        end 
    end

end 

grid = Grid.new 

until grid.finished == true
    grid.go_to_bottom_right
    grid.find_next_possible_right
    if grid.finished_paths % 250000 == 0  
        puts "#{grid.finished_paths} paths evaluated..." 
    end 
end 