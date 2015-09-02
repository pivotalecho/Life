module Conway
  class Board
    attr_reader :grid

    def initialize(array_grid)
      @grid = build_grid(array_grid)
    end

    def build_grid(array_grid)
      array_grid.each_with_index.map do |row, y|
        row.each_with_index.map do |cell, x|
          Cell.new(cell, [x, y], self)
        end
      end
    end

    def self.parse(ascii_grid)
      new(BoardParser.parse(ascii_grid))
    end

    def next_board
      cells = grid.map { |row| row.map(&:next_generation) }
      self.class.new(cells)
    end

    def cell_at(x, y)
      return nil if x < 0
      return nil if y < 0
      return nil if y > width
      return nil if x > height

      grid[y][x]
    end

    def height
      grid.length - 1
    end

    def width
      grid[0].length - 1
    end

    def to_a
      grid.map { |row| row.map(&:state_of_being) }
    end

    def to_s
      to_a.map { |row| row.join(" ") }.join("\n")
    end
  end
end
