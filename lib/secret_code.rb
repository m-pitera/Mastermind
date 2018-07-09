class SecretCode
  attr_reader :code

  def initialize
    @code = gen_secret_code
  end

  def gen_secret_code
    randomness = Random.new
    return (1..4).map { |_| randomness.rand(1..6) }
    puts(blue_b('The secret code has been generated, you may begin . . .'))
  end

  def compare_to_secret_code; end
end
