class Ship
  attr_reader :name, :health, :length, :hit_counter

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @hit_counter = 0
  end

  def sunk?
    @health < 1
  end

  def hit
    @health -= 1
    @hit_counter += 1
  end
end
