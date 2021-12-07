class Ship
  attr_reader :name, :health, :length

  def initialize(name, length)
    @name = name
    @length = length
  end

  def health
    health = @length
  end

  def sunk?
    !(health > 1)
  end
end
