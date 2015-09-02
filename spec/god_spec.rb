require 'spec_helper'

describe Conway::God do
  def living_cell(living_neighbors: 0)
    double(
      :living_cell,
      alive?: true,
      living_neighbors: living_neighbors
    )
  end

  def dead_cell(living_neighbors: 0)
    double(
      :dead_cell,
      alive?: false,
      living_neighbors: living_neighbors
    )
  end

  context 'when the cell is alive' do
    it 'kills underpopulated cells' do
      cell = Conway::God.next_generation(living_cell(living_neighbors: 1))
      expect(cell).to be(Conway::DEAD)
    end

    it 'lives on if the cell has 2 living neighbors' do
      cell = Conway::God.next_generation(living_cell(living_neighbors: 2))
      expect(cell).to be(Conway::ALIVE)
    end

    it 'lives on if the cell has 3 living neighbors' do
      cell = Conway::God.next_generation(living_cell(living_neighbors: 3))
      expect(cell).to be(Conway::ALIVE)
    end

    it 'kills overpopulated cells' do
      cell = Conway::God.next_generation(living_cell(living_neighbors: 4))
      expect(cell).to be(Conway::DEAD)
    end
  end

  context 'when the cell is dead' do
    it 'regenerates as if by reproduction' do
      cell = Conway::God.next_generation(dead_cell(living_neighbors: 3))
      expect(cell).to be(Conway::ALIVE)
    end

    it 'stays dead' do
      cell = Conway::God.next_generation(dead_cell(living_neighbors: 2))
      expect(cell).to be(Conway::DEAD)

      cell = Conway::God.next_generation(dead_cell(living_neighbors: 4))
      expect(cell).to be(Conway::DEAD)
    end
  end
end
