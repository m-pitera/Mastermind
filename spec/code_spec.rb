require '../lib/code'

RSpec.describe Code do
  describe '#generate_code generates a code' do
    it 'is 4 characters' do
      expect(Code.new.code.length).to eq 4
    end

    it 'is made of ints' do
      expect(Code.new.code.all? {|i| i.is_a?(Integer)}).to eq true
    end

    it 'is made of nums 1 through 6' do
      expect(Code.new.code.all? {|i| i.between?(1,6)}).to eq true
    end
  end

  describe '#validate checks guess' do
    context 'returns true when' do
      it 'is correct' do
        user_guess = [1, 1, 1, 1]
        expect(Code.validate(user_guess)).eq to true
      end
    end

    context 'returns false when' do
      it 'is not correct length' do
        user_guess = [1, 1, 1, 1, 1]
        expect(Code.validate(user_guess)).eq to false
      end
      it 'is not integers' do
        user_guess = ['1', '1', '1', '1']
        expect(Code.validate(user_guess)).eq to false
      end
      it 'is not nums 1 through 6' do
        user_guess = [0, 0, 0, 0]
        expect(Code.validate(user_guess)).eq to false
      end
    end

    describe '#give_feedback' do
      it 'returns feedback as [white_pins, red_pins]' do
        the_code = Code.new
        the_code.code = [1, 5, 3, 2]
        user guess = [1, 1, 5, 2]

        expect(the_code.give_feedback(user_guess)).eq to [1, 2]
      end
    end
  end
end
