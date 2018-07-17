require './output'

class SecretCode
  attr_reader :code

  def initialize
    @code = gen_secret_code
    Output.gimme_de_code(@code)
  end

  def gen_secret_code
    randomness = Random.new
    Output.print_code_generated
    return (1..4).map { |_| randomness.rand(1..6) }
  end

  def compare_to_secret_code; end
end
