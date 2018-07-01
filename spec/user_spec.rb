require_relative '../lib/user'

RSpec.describe User do
  let(:input) {User.new}

  describe "#initialize" do
    it "creates an instance of User" do
      expect (input).to eq(true)
    end
  end

end
