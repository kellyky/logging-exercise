class Calculator
  def initialize
    @operations = []
  end

  def square_root(number)
    if number < 0
      raise ArgumentError, "Cannot calculate square root of a negative number"
    end

    result = Math.sqrt(number)
    @operations << { operation: "square_root", input: number, result: result }
    result
  end

  def last_operation
    @operations.last
  end
end

# Running the application
calculator = Calculator.new
puts calculator.square_root(16)  # => 4.0
puts calculator.square_root(-1)  # => Raises ArgumentError

