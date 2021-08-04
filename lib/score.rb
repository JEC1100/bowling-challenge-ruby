class Score
  attr_reader :roll_one, :roll_two, :score

  def initialize
    @roll_one
    @roll_two
  end

  def roll_one(score:)
    @roll_one = score
  end

  def roll_two(score:)
    @roll_two = score
  end
end

