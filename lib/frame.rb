class Frame
  attr_accessor :ball_1_pins, :ball_2_pins

  def initialize
    @ball_1_pins = 0
    @ball_2_pins = 0
  end

  def modifier
    return :strike if ball_1_pins == 10

    return :spare if ball_1_pins + ball_2_pins == 10
  end

  def total_pins
    ball_1_pins + ball_2_pins
  end
end
