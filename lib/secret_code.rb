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

  # most of this is built to acompany the presence of a class that stores all data
  # with that in mind there will be no params necessary as feedback and guess
  # and all these vars will be referring to themselves as values within a hash
  def compare_to_secret_code(guess)
    if guess == code
      red_pin = 4
      return 'win'
    else
      feedback = Array.new(5) {'blank'}
      feedback = check_for_red(guess, feedback)
      feedback = check_for_white(guess, feedback)
      count_pins(feedback)
    end
  end

    private

  def check_for_red(guess)
    guess_index = 0

    until guess_index == 4 do
      feedback[guess_index] = 'red' if guess[guess_index] = code[guess_index]
      guess_index += 1
    end

    return feedback
  end

  def check_for_white(guess)
    guess_index = 0
    code_index = 0

    until guess_index == 4 do
      until code_index == 4 do
        next if feedback[code_index] != 'blank'
        feedback[code_index] = 'white' if guess[guess_index] = code[code_index]
      end
    end

    return feedback
  end

  def count_pins(feedback)
    feedback.each do |pin|
      red_pin += 1 if pin == 'red'
      white_pin += 1 if pin == 'white'
    end
  end
end
