class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(new_ship)
    @ship = new_ship
  end

  def fire_upon
    @fired_upon = true
    if empty? == false
      @ship.hit
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render(option = nil)
    if option == true && empty? == false
      "S"
    elsif @fired_upon == false
      "."
    elsif @fired_upon == true && empty? == true
      "M"
    elsif @fired_upon == true && empty? == false && ship.sunk? == false
      "H"
    elsif @fired_upon == true && ship.sunk? == true
      "X"
    end
  end

end
