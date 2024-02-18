# frozen_string_literal: true

class Robot
  DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

  def initialize(x_coord: 0, y_coord: 0, direction: "NORTH")
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def move
    case direction
    when "NORTH" then move_north
    when "SOUTH" then move_south
    when "EAST" then move_east
    when "WEST" then move_west
    end
  end

  def report
    {
      x_coord: x_coord,
      y_coord: y_coord,
      direction: direction
    }
  end

  def left
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]
  end

  def right
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]
  end

  private
  attr_reader :x_coord, :y_coord, :direction

  def move_north
    @y_coord += 1
  end

  def move_south
    @y_coord -= 1
  end

  def move_east
    @x_coord += 1
  end

  def move_west
    @x_coord -= 1
  end

end
