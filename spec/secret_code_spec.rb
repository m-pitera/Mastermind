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
      xit 'is 4 characters' do
        expect(code.length).to eq 4
      end
      xit 'only contains numbers 1-6' do
        expect(code.all? { |val| val.to_i.between?(1, 6) }).to eq true
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
  describe '#check_for_white' do
    context 'will correctly assign red pins when' do
      xit 'condition 1' do; end
      xit 'condition 2' do; end
      xit 'condition 3' do; end
    end
  end
  describe '#check_for_white' do
    context 'will correctly assign white pins when' do
      xit 'condition 1' do; end
      xit 'condition 2' do; end
      xit 'condition 3' do; end
    end
  end
end
