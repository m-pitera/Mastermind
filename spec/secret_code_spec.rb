require '../lib/secret_code'

RSpec.describe SecretCode do
  describe '#initialize' do
    xit 'generates a secrect code when initialized' do
      # mock to check that gen_secret_code is called
      # but would that be testing behavior or simply ruby?
    end
  end

  describe '#gen_secret_code' do
    context 'creates a code that' do
      code = gen_secret_code
      it 'is 4 characters' do
        expect(code.length).to eq 4
      end
      it 'only contains numbers 1-6' do
        expect(code.all? { |val| val.to_i.between?(1, 6) }).to eq true
      end
    end
  end

  # not sure if i should be testing this?
  describe '#count_pins' do
    context 'will correctly count up the pins' do
      xit 'when all pins white' do
        feedback = Array.new(4) {'red'}
        count_pins(feedback)
        expect(red_pin).to eq 4 && white_pin.to eq 0
      end
      xit 'when all pins red' do
        feedback = Array.new(4) {'white'}
        count_pins(feedback)
        expect(red_pin).to eq 4 && white_pin.to eq 0
      end
      xit 'when ?' do; end
    end
  end

  # am I just testing random cases at this point? is this ok?
  describe '#compare_to_guess' do
    context 'will correctly assign pins when' do
      xit '2 red and 2 white expected' do
        code = SecretCode.new
        code.code = [1, 1, 2, 2]
        guess_s = ['1', '2', '2', '1']
        expect(code.compare_to_guess(guess_s)).to eq [2, 2]
      end
      xit '2 red and 0 white expected' do
        code = SecretCode.new
        code.code = [1, 1, 1, 1]
        guess_s = ['1', '1', '2', '2']
        expect(code.compare_to_guess(guess_s)).to eq [2, 0]
      end
      xit '1 red and 2 white expected' do
        code = SecretCode.new
        code.code = [1, 2, 3, 4]
        guess_s = ['1', '3', '2', '1']
        expect(code.compare_to_guess(guess_s)).to eq [1, 2]
      end
      xit '3 red and 0 white expected' do
        code = SecretCode.new
        code.code = [1, 1, 1, 2]
        guess_s = ['1', '1', '1', '1']
        expect(code.compare_to_guess(guess_s)).to eq [3, 0]
      end
      xit '0 red and 4 white expected' do
        code = SecretCode.new
        code.code = [1, 2, 3, 4]
        guess_s = ['4', '3', '2', '1']
        expect(code.compare_to_guess(guess_s)).to eq [0, 4]
      end
      xit '4 red and 0 white expected' do
        code = SecretCode.new
        code.code = [1, 1, 1, 1]
        guess_s = ['1', '1', '1', '1']
        expect(code.compare_to_guess(guess_s)).to eq [4, 0]
      end
    end
  end
end
