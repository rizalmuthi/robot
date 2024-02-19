# frozen_string_literal: true

require_relative 'robot'

class InvalidCommandError < StandardError; end
class InvalidLocationError < StandardError; end

class CommandParser
  def initialize(table:)
    @table = table
  end

  def parse(command)
    case command
    when /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      _command, x, y, direction = command.gsub(",", " ").split

      x_coord = x.to_i
      y_coord = y.to_i

      if table.valid_position?(x_coord: x_coord, y_coord: y_coord)
        @robot = Robot.new(x_coord: x_coord, y_coord: y_coord, direction: direction)
      else
        raise InvalidLocationError.new("Invalid location")
      end
    when /^MOVE$/
      return if robot_not_placed?

      x_coord, y_coord = robot.next_move
      return unless table.valid_position?(x_coord: x_coord, y_coord: y_coord)
      puts "here"
      robot.move
    when /^LEFT$/
      return if robot_not_placed?
      robot.left
    when /^RIGHT$/
      return if robot_not_placed?
      robot.right
    when /^REPORT$/
      return if robot_not_placed?
      report = robot.report
      puts "Robot position (#{report[:x_coord]}, #{report[:y_coord]} and facing: #{report[:direction]}"
    else
      raise InvalidCommandError.new("Invalid Command")
    end
  end

  private
  attr_reader :table, :robot

  def robot_not_placed?
    robot.nil?
  end
end
