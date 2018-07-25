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
  def compare_to_guess(guess_s)
    guess = format_guess(guess_s)

    print guess
    print code

    unless win?(guess, code)
      feedback = Array.new(4) {'blank'}
      feedback = check_for_red(guess, feedback)
      print feedback
      feedback = check_for_white(guess, feedback)
      pins = count_pins(feedback)
      Output.print_feedback(pins[0], pins[1])
      return pins
    end
  end

    private

  def check_for_red(guess, feedback)
    guess_index = 0

    # change 4 to global var
    # potentially consider 4.times loop while still iterating thru
    until guess_index == 4 do
      feedback[guess_index] = 'red' if guess[guess_index] == code[guess_index]
      guess_index += 1
    end

    return feedback
  end

  def check_for_white(guess, feedback)
    4.times do |guess_index|
      puts 'test1'
      4.times do |code_index|
        if feedback[code_index] != 'blank'
          guess_index += 1 if feedback[code_index] == 'red'
          next
          puts 'should not run'
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
    guess = [0, 0, 0, 0]
    i = 0
    guess_s.each do |val|
      guess[i] = val.to_i
      i += 1
    end
    return guess
  end

  # these 2 methods are practically just conditionals
  # should I simply move them to the case they are used?
  def win?(guess, code)
    return guess == code
  end

  def is_red?(feedback, index)
    return feedback[index] == 'red'
  end
end
