module Conway
  class Cell
    attr_accessor :state_of_being, :x, :y, :board

    def initialize(state_of_being, coords, board)
      @board = board
      @state_of_being = state_of_being
      self.coords = coords
    end

    def alive?
      @state_of_being == Conway::ALIVE
    end

    def next_generation
      God.next_generation(self)
    end

    def coords=(coords)
      @x = coords[0]
      @y = coords[1]
    end

    def neighbors
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

    def living_neighbors
      neighbors.count(&:alive?)
    end

    private

    def cell_at(x, y)
      board.cell_at(x, y)
    end
  end
end
