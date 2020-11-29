class Frame
  attr_accessor :ball_1_pins, :ball_2_pins

  def modifier
    return :strike if ball_1_pins == 10

    return :spare if ball_1_pins + ball_2_pins == 10
  end
end
