require 'logger'

class ApplicationLogger
  LOG_LEVELS = {
    "DEBUG" => Logger::DEBUG,
    "INFO"  => Logger::INFO,
    "WARN"  => Logger::WARN,
    "ERROR" => Logger::ERROR
  }

  def self.build_logger
    # Default to INFO level if environment variable is not set
    log_level_str = ENV['LOG_LEVEL'] || 'INFO'
    log_level = LOG_LEVELS.fetch(log_level_str, Logger::INFO)

    logger = Logger.new(STDOUT)
    logger.level = log_level

    # Custom log format (optional)
    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime} - #{severity}: #{msg}\\n"
    end
    logger
  end
end

# Example of using the logger
logger = ApplicationLogger.build_logger

logger.debug("This is a DEBUG message")
logger.info("This is an INFO message")
logger.warn("This is a WARN message")
logger.error("This is an ERROR message")
