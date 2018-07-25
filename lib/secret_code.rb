require './output'

class SecretCode
  attr_reader :code

  LENGTH_OF_CODE = 4;

  def initialize
    @code = gen_secret_code
    Output.gimme_de_code(@code)
  end

  def gen_secret_code
    randomness = Random.new
    Output.print_code_generated
    return (1..LENGTH_OF_CODE).map { |_| randomness.rand(1..6) }
  end

  # most of this is built to acompany the presence of a class that stores all data
  # with that in mind there will be no params necessary as feedback and guess
  # and all these vars will be referring to themselves as values within a hash
  def compare_to_guess(guess_s)
    guess = format_guess(guess_s)

    unless win?(guess, code)
      feedback = Array.new(LENGTH_OF_CODE) {'blank'}
      feedback = check_for_red(guess, feedback)
      feedback = check_for_white(guess, feedback)
      pins = count_pins(feedback)
      Output.print_feedback(pins[0], pins[1])
      return pins
    end
  end

    private

  def check_for_red(guess, feedback)
    LENGTH_OF_CODE.times do |guess_index|
      feedback[guess_index] = 'red' if guess[guess_index] == code[guess_index]
    end

    return feedback
  end

  def check_for_white(guess, feedback)
    LENGTH_OF_CODE.times do |guess_index|
      LENGTH_OF_CODE.times do |code_index|
        if feedback[code_index] != 'blank'
          guess_index += 1 if feedback[code_index] == 'red'
          next
        end

        feedback[code_index] = 'white' if guess[guess_index] == code[code_index]
      end
    end
    return feedback
  end

  def count_pins(feedback)
    red_pin = feedback.count('red')
    white_pin = feedback.count('white')

    return [red_pin, white_pin]
  end

  def format_guess(guess_s)
    guess = Array.new(LENGTH_OF_CODE)

    LENGTH_OF_CODE.times do |val|
      guess[val] = guess_s[val].to_i
    end

    return guess
  end

  # this method is practically just a conditional statement
  # should I move it to the case they in which it's used?
  def win?(guess, code)
    return guess == code
  end
end
