class Game
  attr_reader :total_frames, :current_frame, :current_frame_number

  def initialize
    @total_frames = []
    @current_frame
    @current_frame_number
  end

  def start_game
    @current_frame = Frame.new(frame: @current_frame_number)
    @current_frame_number = 1
  end
end
