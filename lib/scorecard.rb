class FrameScorecard

attr_reader :pins_1, :pins_2, :array, :frame, :subtotal, :current_frame

  def initialize
    @pins_1 = 0
    @pins_2 = 0
    @roll_count = 0
    @frame = []
    @subtotal = 0
    @strike_switch = false
    @@current_frame = 1
    
  end

  def add_roll_1(pins_1)
    @pins_1 = pins_1
  end

  def add_roll_2(pins_2)
    @pins_2 = pins_2
  end
  
  def displays_frame
    @frame<<@pins_1<<@pins_2
  end

  def subtotals_frame(frame = [])
    @frame = frame
      if last_frame_strike? == true
        return @subtotal = @frame.reduce(:+) * 2
      elsif last_frame_strike? == false
        return @subtotal = @frame.reduce(:+)
      end 
    end

  def last_frame_strike?
    @strike_switch
  end
  
  def bonus_score_frame?
    if last_frame_strike? 
      @subtotal = 2*(@frame.reduce(:+))
    end
  end

  def print_full_frame
    if strike? == false && spare? == false
      print "|#{@frame.join(", ")}| #{@subtotal}|"
    else
      strike_spare_logic
    end
  end

  def strike_spare_logic
    if strike? == true && first_frame? == true
      print "|X, -| -|"
    strike_switch = true
    elsif strike? == true && first_frame? == false
      print "|X, -| #{@subtotal}|"
      strike_switch = true
    elsif strike? == false && spare? == true
      print "|#{@frame.first}, /| #{@subtotal}|"
      strike_switch = false
    end
  end

   def frame_over?
    @frame.length > 1 || strike? == true
   end

   def strike?
    pins_1 == 10
   end

   def first_frame?
    @@current_frame < 2
   end

   def spare?
    @pins_1 + @pins_2 == 10 && strike? == false
   end

   def current_frame
    if frame_over?
      @@current_frame += 1
    else
      @@current_frame = @@current_frame
    end
   end

   def rolls_left(frame)
    @frame = frame
    2 - @frame.length
   end

   def frame_open?
    @roll_count < 2 && @subtotal < 10
   end
end
