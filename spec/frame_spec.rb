require 'frame'

describe Frame do
  let(:subject) { Frame.new(frame: 1) }

  it 'tallies the two scores from the current frame' do
    one = subject.score.roll_one(score: 4)
    two = subject.score.roll_two(score: 5)
    expect(subject.frame_tally(one, two)).to eq(9)
  end

  it 'knows which frame number it is within current game' do
    expect(subject.frame).to eq(1)
  end
end











































# describe "#strike_frame" do
#   it "tallies current strike bonus frame" do
#     roll_3 = 4
#     roll_4 = 5
#     expect(subject.tally(roll_1, roll_2)).to eq(9)
#   end
# end
# end

# 1
# 10
# over10 = strike
# if strike
#   gets bonus framescore *2