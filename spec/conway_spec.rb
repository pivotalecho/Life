require 'spec_helper'

describe Conway do
  it "has a version number" do
    expect(Conway::VERSION).not_to be nil
  end

  it "kills overcrowded cells" do
    board = Conway::Board.new(
      [
        [1, 1, 1],
        [1, 1, 1],
        [1, 1, 1]
      ]
    )

    new_board = board.next_board

    expect(new_board.to_a).to eq(
      [
        [1, 0, 1],
        [0, 0, 0],
        [1, 0, 1]
      ]
    )
  end

  it 'spawns new cells as if by reproduction' do
    board = Conway::Board.new(
      [
        [1, 1, 1],
        [0, 0, 0],
        [0, 0, 0]
      ]
    )

    new_board = board.next_board

    expect(new_board.to_a).to eq(
      [
        [0, 1, 0],
        [0, 1, 0],
        [0, 0, 0]
      ]
    )
  end

  describe 'neighbors of' do
    it 'returns the neighbors of the cell at the given coordinates' do
      board = Conway::Board.new([
        ['a', 'b', 'c'],
        ['d', 'e', 'f'],
        ['g', 'h', 'i']
      ])

      neighbors = board.neighbors_of(1, 1)
      expect(neighbors).to match_array(['a', 'b', 'c', 'd', 'f', 'g', 'h', 'i'])

      neighbors = board.neighbors_of(0, 0)
      expect(neighbors).to match_array(['b', 'd', 'e'])

      neighbors = board.neighbors_of(0, 2)
      expect(neighbors).to match_array(['b', 'e', 'f'])

      neighbors = board.neighbors_of(2, 1)
      expect(neighbors).to match_array(['d', 'e', 'f', 'g', 'i'])
    end
  end

  describe 'to_s' do
    it 'prints the ASCII board' do
      board = Conway::Board.new(
        [
          [1, 1, 1],
          [0, 0, 0],
          [0, 0, 0]
        ]
      )

      expect(board.to_s).to eq("1 1 1\n0 0 0\n0 0 0")
    end

  end
end
