class Ship
  attr_reader :name, :health, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = 3
  end
end
