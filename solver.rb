class Solver
    def factorial(n)
      raise ArgumentError, 'Input should not be a negative integer' if n.negative?
  
      result = 1
      if n.zero?
        result = 1
      else
        (1..n).each do |int|
          result *= int
        end
      end
  
      result
    end
  end
  