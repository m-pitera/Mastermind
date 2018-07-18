require '../lib/validate'

RSpec.describe Valid do
  describe '#is_valid?' do
    context 'returns true when' do
      it 'is correct' do
        user_guess = [1, 1, 1, 1]
        expect(Validate.is_valid?(user_guess)).eq to true
      end
    end

    context 'returns false when' do
      it 'is not correct length' do
        user_guess = [1, 1, 1, 1, 1]
        expect(Validate.is_valid?(user_guess)).eq to false
      end
      it 'is not integers' do
        user_guess = %w[1 1 1 1]
        expect(Validate.is_valid?(user_guess)).eq to false
      end
      it 'is not nums 1 through 6' do
        user_guess = [0, 0, 0, 0]
        expect(Validate.is_valid?(user_guess)).eq to false
      end
    end
  end
end
