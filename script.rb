# frozen_string_literal: true

require_relative 'cell_grid'

grid =
  [
    [nil, nil, 1, nil, nil],
    [nil, nil, 1, 1, nil],
    [nil, 2, 2, 1, nil],
    [nil, nil, nil, 1, nil],
    [nil, nil, nil, nil, nil]
  ]
cell_grid = CellGrid.new(grid)

puts 'Before grid:'
cell_grid.print_grid

cell_grid.pass_time

puts 'After grid:'
cell_grid.print_grid

puts "\n"

puts "***For Bonus Question of 10x10 Grid***"
grid = [
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, 1, 1, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, 2, nil, nil, nil, nil, nil],
  [nil, nil, nil, 1, 2, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, 1, nil, nil, nil, nil, nil, nil, nil],
  [nil, 2, 1, nil, nil, nil, nil, nil, nil, nil],
  [nil, 2, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
]
cell_grid = CellGrid.new(grid)

puts 'Before 1st generation grid:'
cell_grid.print_grid

19.times { cell_grid.pass_time }

puts 'After 19 generations later grid:'
cell_grid.print_grid
