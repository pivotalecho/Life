require 'spec_helper'
class FakeBoard
  def cell_at(x, y)
    return nil if y < 0
    return nil if y > 2
    return nil if x < 0
    return nil if x > 2

    [
      ['a', 'b', 'c'],
      ['d', 'e', 'f'],
      ['g', 'h', 'i']
    ][y][x]
  end
end

describe Conway::Cell do
  describe 'neighbors' do
    let(:board) { FakeBoard.new }
    let(:cell) { Conway::Cell.new(Conway::ALIVE, [1, 1], board) }

    it 'returns the neighbors of the cell' do
      cell.coords = [1, 1]
      expect(cell.neighbors).to match_array(['a', 'b', 'c', 'd', 'f', 'g', 'h', 'i'])

      cell.coords = [0, 0]
      expect(cell.neighbors).to match_array(['b', 'd', 'e'])

      cell.coords = [2, 0]
      expect(cell.neighbors).to match_array(['b', 'e', 'f'])

      cell.coords = [1, 2]
      expect(cell.neighbors).to match_array(['d', 'e', 'f', 'g', 'i'])
    end
  end
end
