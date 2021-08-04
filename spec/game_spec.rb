require 'game'

describe Game do
  describe '.start_game' do
      it 'should create a new instance of frame, assigning it number 1' do
        subject.start_game
        expect(subject.current_frame).to be_instance_of(Frame)
        expect(subject.current_frame_number).to eq(1)
      end
  end
end