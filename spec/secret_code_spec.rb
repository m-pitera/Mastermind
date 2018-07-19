require '../lib/secret_code'

RSpec.describe SecretCode do
  describe '#initialize' do
    xit 'generates a secrect code when initialized' do
      # mock to check that gen_secret_code is called
      # but would that be testing behavior?
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
  describe '#check_for_red' do
    context 'will correctly assign red pins when' do
      it 'condition 1' do; end
      xit 'condition 2' do; end
      xit 'condition 3' do; end
    end
  end

  # not sure if i should be testing this?
  describe '#check_for_white' do
    context 'will correctly assign white pins when' do
      xit 'condition 1' do; end
      xit 'condition 2' do; end
      xit 'condition 3' do; end
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
      xit 'when ?' do

      end
    end
  end
  describe '#compare_to_secret_code' do
    context 'will correctly assign pins when' do
      xit 'condition 1' do; end
      xit 'condition 2' do; end
      xit 'condition 3' do; end
    end
  end
end
