require 'framescore'

describe Framescore do
  it 'keeps track of pins downed' do
    expect(subject).to be_an_instance_of(Framescore)
  end

      describe "#tally" do
        it "tallies current framescore" do
          roll_1 = 4
          roll_2 = 5
          expect(subject.tally(roll_1, roll_2)).to eq(9)
        end
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