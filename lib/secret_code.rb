require './output'
require 'pry'

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
  def compare_to_secret_code(guess_s)
    guess = [0, 0, 0, 0]
    i = 0
    guess_s.each do |val|
      guess[i] = val.to_i
      i += 1
    end

    print guess
    print code
    feedback = Array.new(4) {'blank'}
    if guess == code
      puts 'test win'
      feedback = Array.new(4) {'red'}
      return 'win'
    else
      feedback = check_for_red(guess, feedback)
      feedback = check_for_white(guess, feedback)
    end

    pins = count_pins(feedback)
    Output.print_feedback(pins[0], pins[1])
  end

    private

  def check_for_red(guess, feedback)
    guess_index = 0

    until guess_index == 4 do
      print guess[guess_index]
      print code[guess_index]
      if guess[guess_index] == code[guess_index]
        feedback[guess_index] = 'red'
      end
      guess_index += 1
    end

    print feedback
    return feedback
  end

  def check_for_white(guess, feedback)
    guess_index = 0
    code_index = 0

    until guess_index == 4 do
      code_index = 0
      until code_index == 4 do
        if feedback[code_index] != 'blank'
          if feedback[code_index] == 'red'
            guess_index += 1
          end
          code_index += 1
          next
        end
        # binding.pry
        if guess[guess_index] == code[code_index]
          # binding.pry
          feedback[code_index] = 'white'
          guess_index += 1
          code_index = 0
        end
        code_index += 1
      end

      guess_index += 1
    end
    print feedback
    print guess_index
    print code_index
    return feedback
  end

  def count_pins(feedback)
    red_pin = 0
    white_pin = 0
    feedback.each do |pin|
      red_pin += 1 if pin == 'red'
      white_pin += 1 if pin == 'white'
    end

    return [red_pin, white_pin]
  end
end
