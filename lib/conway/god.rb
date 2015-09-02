module Conway
  class God
    def self.next_generation(schroedinger)
      if schroedinger.alive?
        return ALIVE if schroedinger.living_neighbors == 3
        return ALIVE if schroedinger.living_neighbors == 2
        return DEAD if schroedinger.living_neighbors > 3
        return DEAD if schroedinger.living_neighbors < 2
      else
        return ALIVE if schroedinger.living_neighbors == 3
        return DEAD
      end
    end
  end
end
