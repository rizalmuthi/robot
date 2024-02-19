# frozen_string_literal: true

require_relative 'table'
require_relative 'command_parser'

table = Table.new(length: 5, width: 5)
command = CommandParser.new(table: table)

puts "Welcome to ToyRobot simulator"
puts "Available comamnds: PLACE, MOVE, LEFT, RIGHT, REPORT"
puts "Example: PLACE 0,0,NORTH"

loop do
  puts "Input command, (EXIT to quit):"
  puts

  input = gets
  break if input =~ /exit/i
  command.parse(input)
end
