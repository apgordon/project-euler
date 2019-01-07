=begin 
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=end 

# Executes the Collatz function given some term, n, until the result is 1
def collatz_evaluate_term(n)
    if n % 2 == 0 
        @result = n/2
    else
        @result = 3*n + 1
    end 
    @terms << @result
    
    if @result == 1 
        @collatz_solved = true
    end
end


@solutions = {} 

# Adds the term and how many terms are in its Collatz sequence to the @solutions hash
def collatz_evaluate_sequence(starting_term)
    @terms = []
    @term = starting_term
    @result = @term 
    @collatz_solved = false
    @terms << @term

    until @collatz_solved == true 
        collatz_evaluate_term(@result)
    end
    
    @solutions[@term] = @terms.count
end 

# Evaluates each term starting with the largest possible, then outputs the term with the most terms in its Collatz sequence
def find_largest_chain 
    n = 999999
    until n < 700000
        collatz_evaluate_sequence(n)
        n -= 1
    end
    puts @solutions.max_by { |k,v| v } 
end 

find_largest_chain
