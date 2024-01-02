# frozen_string_literal: true

# Log line parser
class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(':')[1].strip if @line.include?(':')
  end

  def log_level
    @line.split(':')[0].strip.gsub(/[\[\]]/, '').downcase if @line.include?(':')
  end

  def reformat
    "#{message} (#{log_level.gsub(/[\[\]]/, '').downcase})"
  end
end
