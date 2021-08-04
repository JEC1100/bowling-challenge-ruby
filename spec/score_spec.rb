require 'score'

describe Score do
  describe '.roll_one' do
    it 'takes an integer for the number of pins downed with roll one' do
    expect(subject.roll_one(score: 5)).to eq(5)
    end
  end

  describe '.roll_two' do
    it 'takes an integer for the number of pins downed with roll two' do
    expect(subject.roll_two(score: 5)).to eq(5)
    end
  end

  describe '.strike?' do
    it 'calculates whether roll_one is a strike' do
      subject.roll_one(score: 10)
      expect(subject.strike?).to eq(true)
    end
  end

  describe '.spare?' do
    it 'calculates whether roll_two is a spare' do
      subject.roll_one(score: 9)
      subject.roll_two(score: 1)
      expect(subject.spare?).to be true
  end
  end

  describe '.gutter_ball?' do
    it 'calculates whether roll_one or roll_two is a gutter ball' do
      subject.roll_one(score: 0)
      subject.roll_two(score: 4)
      expect(subject.gutter_ball?).to be true
    end
  end
end