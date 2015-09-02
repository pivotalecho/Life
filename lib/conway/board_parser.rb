module Conway
  class BoardParser
    def self.parse(ascii_grid)
      new(ascii_grid).parse
    end

    attr_accessor :ascii_grid

    def initialize(ascii_grid)
      @ascii_grid = ascii_grid
    end

    def parse
      ascii_grid.split("\n").map do |ascii_row|
        parse_row(ascii_row)
      end
    end

    def parse_row(ascii_row)
      ascii_row.gsub(/\s/, '').each_char.map do |ascii_cell|
        ascii_cell.to_i
      end
    end
  end
end
