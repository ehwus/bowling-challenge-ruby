class Player
  attr_reader :name
  attr_accessor :frames

  def initialize(name)
    @name = name
    @frames = {}
  end

  def current_score
    total = 0

    @frames.each do |frame, outcome|
      if frame > 1
        total += outcome.total_pins if @frames[frame - 1].modifier == :strike
        total += outcome.ball_1_pins if @frames[frame - 1].modifier == :spare
      end

      total += outcome.total_pins
    end

    total
  end
end