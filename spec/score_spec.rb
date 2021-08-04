require 'score'

describe Score do
  describe '.roll_one' do
    it 'takes an integer for the number of pins downed with roll one' do
    expect(subject.roll_one(score: 4)).to eq(4)
    end
  end

  describe '.roll_two' do
    it 'takes an integer for the number of pins downed with roll two' do
    expect(subject.roll_two(score: 5)).to eq(5)
    end
  end
end