# frozen_string_literal: true

class Table
  def initialize(width:, length:)
    @length = length
    @width = width
  end

  def valid_position?(x_coord: , y_coord:)
    (0...length).cover?(x_coord) &&
      (0...width).cover?(y_coord)
  end

  private
  attr_reader :length, :width
end
