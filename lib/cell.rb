class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  # Returns true if ship has been placed in Cell.
  def empty?
    @ship == nil
  end

  # Initializes new ship on Cell when passed as argument
  def place_ship(new_ship)
    @ship = new_ship
  end

  # Changes @fired_upon to true. If Cell has a Ship, ship is hit.
  def fire_upon
    @fired_upon = true
    if empty? == false
      @ship.hit
    end
  end

  # Returns true/false depending on boolean in @fired_upon
  def fired_upon?
    @fired_upon
  end

  # Creates visible cues for each Cell. The "image" being displayed will vary
  # depending on status of Cell and Ship. 
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
