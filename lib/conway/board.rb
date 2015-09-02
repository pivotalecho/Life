module Conway
  class Board
    attr_reader :grid
    alias to_a grid

    def initialize(grid)
      @grid = grid
    end

    def self.parse(ascii_grid)
      new(
        ascii_grid.split("\n").map do |ascii_row|
          ascii_row.gsub(/\s/, '').each_char.map do |ascii_cell|
            ascii_cell.to_i
          end
        end
      )
    end

    def next_board
      self.class.new(
        grid.each_with_index.map do |row, y|
          row.each_with_index.map do |cell, x|
            next_generation(x, y)
          end
        end
      )
    end

    def next_generation(x, y)
      living_neighbors = living_neighbors(x, y)
      schroedinger = cell_at(x, y)

      should_live?(schroedinger, living_neighbors)
    end

    def should_live?(schroedinger, living_neighbors)
      return 1 if living_neighbors == 3
      return 1 if alive?(schroedinger) && living_neighbors == 2
      return 0
    end

    def living_neighbors(x, y)
      neighbors_of(x, y).count { |n| alive?(n) }
    end

    def alive?(cell)
      cell == 1
    end

    def cell_at(x, y)
      cell_in_row(row(y), x)
    end

    def cell_in_row(row, index)
      return nil if index < 0
      row[index] || nil
    end

    def row(index)
      return [] if index < 0
      grid[index] || []
    end

    def neighbors_of(x, y)
      [
        cell_at(x - 1, y - 1),
        cell_at(x    , y - 1),
        cell_at(x + 1, y - 1),

        cell_at(x - 1, y),
        cell_at(x + 1, y),

        cell_at(x - 1, y + 1),
        cell_at(x    , y + 1),
        cell_at(x + 1, y + 1),
      ].compact
    end

    def to_s
      grid.map { |row| row.join(' ') }.join("\n")
    end
  end
end
