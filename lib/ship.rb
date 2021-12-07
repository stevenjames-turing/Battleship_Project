class Ship
  attr_reader :name, :health, :length, :hits

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @hits = 0
  end

  def sunk?
    @health < 1
  end

  def hit
    @health -= 1
    @hits += 1
  end
end
