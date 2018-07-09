require './output'
require './colors'
require './validate'

# User class knows too much, i made a mess and now refactoring
class User
  include Validate
  attr_reader :guess, :guesses_left, :first_time

  def initialize
    @guesses_left = 10
    @guess = ''
    @first_time = true
  end

  def take_input
    the_guesses_left = @guesses_left
    the_input = Output.print_input_prompt(the_guesses_left)

    the_input = is_quit?(the_input)

    take_input unless !(is_valid?(the_input))

    @guess = the_input
    @guesses_left -= 1
    next_command('input')
  end

  def give_feedback(p_input = @guess)
    # if GameStatus.game_over?(@guesses_left)
    #   quit_plz
    # end
    GameStatus.guesses_left?(@guesses_left)

    puts("I haven't coded the feedback yet :)")
    next_command('feedback')
  end

  def prompt_start
    system 'clear'

    Output.print_start_again(@first_time)

    return gets.chomp
  end

  private

  def next_command(previous)
    if (previous.eql? 'input')
      give_feedback
      return
    elsif (previous.eql? 'feedback')
      take_input
      return
    else
      return
    end
  end

  def is_quit?(user_input)
    if (user_input.downcase.eql? 'quit')
      # quit_plz
      puts 'some code got lost while refactoring'
      exit(0)
    else
      return user_input.split(' ')
    end
  end
end
