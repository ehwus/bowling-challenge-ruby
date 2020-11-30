class Player
  attr_reader :name
  attr_accessor :frames

  def initialize(name)
    @name = name
    @frames = {}
  end

  def current_score
    total = 0

    @frames.each do |round_number, frame|
      if round_number > 1
        total += frame.total_pins if @frames[round_number - 1].modifier == :strike
        total += frame.ball_1_pins if @frames[round_number - 1].modifier == :spare
      end

      if round_number > 2
        total += frame.total_pins if @frames[round_number - 2].modifier == :strike
      end

      total += frame.total_pins

      p round_number
      p total
    end

    total
  end
end