class Human
  attr_accessor :strengh, :intelligence, :stealth, :health

  def initialize
  @strength =
  @intelligence = 3
  @stealth = 3
  @health = 100
  end

  def attack(object)
    if object.class.ancestors.include?(Human)
      object.health -= 10
      true
    else
      false
    end
  end
end

h = Human.new
h2 = Human.new
puts h.attack(h2)
puts h.attack("Not a human")
puts h2.health
