require 'frame'

describe Frame do
  it "has ball_1_pins and ball_2_pins read writable" do
    example_frame = Frame.new
    example_frame.ball_1_pins = 3
    example_frame.ball_2_pins = 3
    expect(example_frame.ball_1_pins).to eq(3)
    expect(example_frame.ball_2_pins).to eq(3)
  end

  describe "#modifier" do
    it "returns :strike when 10 pins down in ball 1" do
      example_frame = Frame.new
      example_frame.ball_1_pins = 10
      expect(example_frame.modifier).to eq(:strike)
    end

    it "returns :spare when total pins 10 over 2 balls" do
      example_frame = Frame.new
      example_frame.ball_1_pins = 7
      example_frame.ball_2_pins = 3
      expect(example_frame.modifier).to eq(:spare)
    end

    it "returns nil when neither condition met" do
      example_frame = Frame.new
      example_frame.ball_1_pins = 0
      example_frame.ball_2_pins = 4
      expect(example_frame.modifier).to eq(nil)
    end
  end

  describe "#total_pins" do
    it "returns 0 if there are no pins" do
      expect(Frame.new.total_pins).to eq(0)
    end

    it "returns correctly when there are two results" do
      example_frame = Frame.new
      example_frame.ball_1_pins = 0
      example_frame.ball_2_pins = 4
      expect(example_frame.total_pins).to eq(4)
    end
  end
end