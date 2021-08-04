class Score
  attr_reader :roll_one, :roll_two, :score, :strike, :spare, :gutter_ball

  def initialize
    @roll_one
    @roll_two
    @strike = false
    @spare = false
    @gutter_ball = false
  end

  def roll_one(score:)
    @roll_one = score
  end

  def roll_two(score:)
    @roll_two = score
  end

  def strike?
    @roll_one == 10
  end

  def spare?
    @roll_one != 10 && @roll_one + @roll_two == 10
 
  end

  def gutter_ball?
    @roll_one == 0 || @roll_two == 0 
  end
end

