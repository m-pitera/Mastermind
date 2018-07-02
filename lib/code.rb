require './output'

class Code
  attr_reader :code

  def initialize
    @code = generate_code
  end

  def self.compare(guess)

  end

    private

  def generate_code
    randomness = Random.new
    return (1..4).map { |_| randomness.rand(1..6) }
    Output.print_code_generated
  end

  def is_valid?(guess); end

  def is_correct?(guess); end

  def give_feedback(guess); end
end
