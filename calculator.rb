require 'logger'

class Calculator
  def initialize
    @operations = []
    @logger = Logger.new('app.log', 10, 1024000)  # Log to file with rotation
    @logger.level = Logger::INFO
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime} - #{severity}: #{msg}\n"
    end
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
calculator.square_root(16)  # => 4.0
calculator.square_root(-1)  # => Logs error before raising ArgumentError
