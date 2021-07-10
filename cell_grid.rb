# frozen_string_literal: true

require_relative 'cell'

class CellGrid
  attr_accessor :grid

  MODIFIER_ARR = [-1, 0, 1].freeze

  # Input should be array of arrays with ages of nil, 1, 2, or 3
  def initialize(grid)
    @grid = grid.map do |sub_array|
      sub_array.map do |age|
        Cell.new(age)
      end
    end

    @max_y = @grid.count
    @max_x = @grid.first.count
  end

  def pass_time
    result = dup_grid

    result.each_with_index do |sub_array, y|
      sub_array.each_with_index do |cell, x|
        coord = [y, x]
        neighbors_array = neighbors(coord)

        cell.pass_time(neighbors_array)
      end
    end

    @grid = result
  end

  # @note `puts` print arrays weirdly
  # @example
  # [nil, nil, 1, nil, nil]
  # [nil, nil, 1, 1, nil]
  # [nil, 2, 2, 1, nil]
  # [nil, nil, nil, 1, nil]
  # [nil, nil, nil, nil, nil]
  def print_grid
    @grid.map do |sub_array|
      print sub_array.map(&:age)
      puts ''
    end
  end

  private

  def dup_grid
    @grid.map { |sub_array| sub_array.map(&:clone) }
  end

  # @param coord [Array<Integer>] An array with 2 elements y,x indicating position in grid
  #   @example [0,0] starts at top-left of grid
  #   @example [n,m] for an nxm grid is the bottom-right of the grid
  #   @example [0,m] is the top-right
  #   @example [n,0] is the bottom-left
  # @return value at grid[y][x]
  def value_at_coord(coord)
    y = coord[0]
    x = coord[1]
    sub_array = @grid[y]
    sub_array[x] if sub_array.is_a?(Array)
  end

  # @param coord [Array<Integer>] An array with 2 elements y,x indicating position in grid
  # @return [Array<Cell>] Returns array of neighbor Cells
  def neighbors(coord)
    result = []

    y = coord[0]
    x = coord[1]

    MODIFIER_ARR.each do |y_modifier|
      MODIFIER_ARR.each do |x_modifier|
        next if y_modifier.zero? && x_modifier.zero? # self is not a neighbor

        new_y = y + y_modifier
        new_x = x + x_modifier

        next if new_y < 0 || new_x < 0

        neighbor_value = value_at_coord([new_y, new_x])
        result << neighbor_value if neighbor_value
      end
    end

    result
  end
end
