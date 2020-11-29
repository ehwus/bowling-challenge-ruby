# frozen_string_literal: true

class Frame
  attr_reader :ball_1_pins, :ball_2_pins

  def initialize
    @ball_1_pins = 0
    @ball_2_pins = 0
  end

  def add_pins_ball1(score)
    error_check(score)
    @ball_1_pins = score
  end

  def add_pins_ball2(score)
    error_check(score)
    @ball_2_pins = score
  end

  def modifier
    return :strike if ball_1_pins == 10

    return :spare if ball_1_pins + ball_2_pins == 10
  end

  def total_pins
    ball_1_pins + ball_2_pins
  end

  private

  def error_check(score)
    raise 'Invalid number of pins' if score + @ball_1_pins > 10
  end
end
