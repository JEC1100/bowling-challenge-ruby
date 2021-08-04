class Frame

  attr_reader :frame_tally, :frame, :score

  def initialize(frame:)
    @frame_tally = []
    @frame = frame
    @score = Score.new
  end
    
  def frame_tally(roll_one, roll_two)
    roll_one + roll_two
  end
end