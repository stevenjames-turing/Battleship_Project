class Ship
  attr_reader :name, :health, :length, :hit_counter

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @hit_counter = 0
  end
 # When initialized the ship's health == it's size. It's health
 # decreases by one each time it's hit. When the health > 1 the ship
 # will be sunk.
  def sunk?
    @health < 1
  end

# When the cell the ship in sitting in is hit,
# the number of hits on the ship +1 and the health -1
  def hit
    @health -= 1
    @hit_counter += 1
  end
end
