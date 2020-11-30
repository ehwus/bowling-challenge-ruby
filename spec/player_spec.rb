require 'player'

describe Player do
  let(:frame) { double :frame }

  it "initializes with a name" do
    player = Player.new("Partario")
    expect(player.name).to eq("Partario")
  end

  it "has an accessible hash for frames" do
    player = Player.new("Partario")
    expect(player.frames).to be_a_kind_of(Hash)
    player.frames[1] = frame
    expect(player.frames[1]).to eq(frame)
  end

  describe "#current_score" do
    it "returns 0 if no frames have been played" do
      expect(Player.new("Partario").current_score).to eq(0)
    end

    it "returns correctly if a frame has values" do
      player = Player.new("Partario")
      player.frames[1] = double :frame, total_pins: 5
      expect(player.current_score).to eq(5)
    end

    it "returns correctly after a strike" do
      player = Player.new("Partario")
      player.frames[1] = double :frame, modifier: :strike, total_pins: 10
      player.frames[2] = double :frame, total_pins: 5
      expect(player.current_score).to eq(20)
    end

    it "returns correctly after a spare" do
      player = Player.new("Partario")
      player.frames[1] = double :frame, modifier: :spare, total_pins: 10
      player.frames[2] = double :frame, ball_1_pins: 5, total_pins: 5
      expect(player.current_score).to eq(20)
    end

    it "returns correctly after two strikes" do
      player = Player.new("Partario")
      player.frames[1] = double :frame, modifier: :strike, total_pins: 10
      player.frames[2] = double :frame, modifier: :strike, total_pins: 10
      expect(player.current_score).to eq(30)
    end

    it "returns correctly after 3 strikes" do
      player = Player.new("Partario")
      player.frames[1] = double :frame, modifier: :strike, total_pins: 10
      player.frames[2] = double :frame, modifier: :strike, total_pins: 10
      player.frames[3] = double :frame, modifier: :strike, total_pins: 10
      expect(player.current_score).to eq(60)
    end

    it "returns correctly after 10 strikes" do
      player = Player.new("Partario")
      10.times do |n|
        player.frames[n + 1] = double :frame, modifier: :strike, total_pins: 10
      end
      expect(player.current_score).to eq(270)
    end
  end
end