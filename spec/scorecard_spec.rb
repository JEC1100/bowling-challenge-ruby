require 'scorecard'

describe FrameScorecard do

  it 'shows scorecard with single element 4, when I roll 4' do
    expect(subject.add_roll_1(4)).to eq(4)
  end

  it 'shows scorecard with frame of two roll scores as an array' do
    subject.add_roll_1(4)
    subject.add_roll_2(5)
    expect(subject.displays_frame).to eq([4, 5])
  end

  it 'shows a scorecard with total of 9 when I roll 4 and 5' do
    subject.add_roll_1(4)
    subject.add_roll_2(5)
    expect(subject.subtotals_frame([4, 5])).to eq(9)
  end

  it 'shows a scorecard with an array of two rolls followed by the running total' do
    subject.add_roll_1(4)
    subject.add_roll_2(5)
    subject.subtotals_frame([4, 5])
    expect { subject.print_full_frame }.to output("|4, 5| 9|").to_stdout
  end

  it 'knows when frame is over' do
    subject.add_roll_1(9)
    subject.add_roll_2(1)
    subject.displays_frame
    expect(subject.frame_over?).to eq true
  end

  it 'knows when roll_1 is a strike' do
    subject.add_roll_1(10)
    expect(subject.strike?).to eq true
  end

  it 'knows when roll_2 is a spare' do
    subject.add_roll_1(4)
    subject.add_roll_2(6)
    expect(subject.spare?).to eq true
  end

  it 'keeps count of frame number' do
    subject.add_roll_1(0)
    subject.add_roll_2(1)
    subject.displays_frame
    expect(subject.current_frame).to eq(2)
  end

  it "knows what roll it is" do
    expect(subject.rolls_left([1, 0])).to eq(0)
  end

  it 'knows if frame is open or closed' do
    subject.add_roll_1(9)
    subject.add_roll_1(1)
    subject.displays_frame
    expect(subject.frame_open?).to eq true
  end

  it "scorecard displays a X if it is a strike" do
    subject.add_roll_1(10)
    subject.current_frame == 1
    expect { subject.print_full_frame }.to output("|X, -| 0|").to_stdout
  end

  it "scorecard displays a / if it is a spare" do
    subject.last_frame_strike? == false
    subject.subtotals_frame([5, 0])
    subject.current_frame == 1
    expect { subject.print_full_frame }.to output("|5, 0| 5|").to_stdout
  end

  describe "#strike_logic" do
    it "doubles score of frame after strike frame" do
      subject.add_roll_1(10)
      subject.last_frame_strike? == true
      subject.bonus_score_frame? == true
      subject.add_roll_1(4)
      subject.add_roll_1(4)
      subject.subtotals_frame([4, 4])
      expect { subject.print_full_frame }.to output("|4, 4| 8|").to_stdout
    end
  end
end