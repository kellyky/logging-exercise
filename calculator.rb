require 'logger'

class Calculator
  def initialize
    @operations = []
    @logger = Logger.new(STDOUT)  # Log to the console
    @logger.level = Logger::INFO  # Set default logging level
  end

  def square_root(number)
    if number < 0
      @logger.error("Attempted square root of negative number: #{number}")
      raise ArgumentError, "Cannot calculate square root of a negative number"
    end

    result = Math.sqrt(number)
    @logger.info("Calculated square root of #{number}: #{result}")
    @operations << { operation: "square_root", input: number, result: result }
    result
  end

  def last_operation
    @logger.debug("Fetching last operation")
    @operations.last
  end
end

# Running the application with logging
calculator = Calculator.new
puts calculator.square_root(16)  # => 4.0
puts calculator.square_root(-1)  # => Logs error before raising ArgumentError

