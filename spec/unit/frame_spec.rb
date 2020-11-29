# frozen_string_literal: true

require 'frame'

describe Frame do
  describe '#add_pins_ball1' do
    it 'adds a readable pin count to ball 1' do
      example_frame = Frame.new
      example_frame.add_pins_ball1(3)
      expect(example_frame.ball_1_pins).to eq(3)
    end

    it 'throws an error if the pin count is above 10' do
      example_frame = Frame.new
      expect { example_frame.add_pins_ball1(11) }.to raise_error('Invalid number of pins')
    end
  end

  describe '#add_pins_ball2' do
    it 'adds a readable pin count to ball 2' do
      example_frame = Frame.new
      example_frame.add_pins_ball2(3)
      expect(example_frame.ball_2_pins).to eq(3)
    end

    it 'throws an error if total would be over 10' do
      example_frame = Frame.new
      example_frame.add_pins_ball1(9)
      expect { example_frame.add_pins_ball2(5) }.to raise_error('Invalid number of pins')
    end
  end

  describe '#modifier' do
    it 'returns :strike when 10 pins down in ball 1' do
      example_frame = Frame.new
      example_frame.add_pins_ball1(10)
      expect(example_frame.modifier).to eq(:strike)
    end

    it 'returns :spare when total pins 10 over 2 balls' do
      example_frame = Frame.new
      example_frame.add_pins_ball1(7)
      example_frame.add_pins_ball2(3)
      expect(example_frame.modifier).to eq(:spare)
    end

    it 'returns nil when neither condition met' do
      example_frame = Frame.new
      example_frame.add_pins_ball1(3)
      example_frame.add_pins_ball2(4)
      expect(example_frame.modifier).to eq(nil)
    end
  end

  describe '#total_pins' do
    it 'returns 0 if there are no pins' do
      expect(Frame.new.total_pins).to eq(0)
    end

    it 'returns correctly when there are two results' do
      example_frame = Frame.new
      example_frame.add_pins_ball1(7)
      example_frame.add_pins_ball2(2)
      expect(example_frame.total_pins).to eq(9)
    end
  end
end
