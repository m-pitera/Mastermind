require './output'
require './colors'

class User
  attr_reader :guess, :guesses_left, :first_time

  def initialize
    @guesses_left = 10
    @guess = ''
    @first_time = true
  end

  def take_input
    the_guesses_left = @guesses_left
    the_input = Output.print_input_prompt(the_guesses_left)

    if (the_input.downcase.eql? 'quit')
      quit_plz
    else
      the_input = the_input.split(' ')
    end

    if (validate_input(the_input))
      @guess = the_input
      @guesses_left -= 1
      next_command('input')
      return
    else
      # further into dev I might check and return for specific cases of incorrect input
      # puts(Colors.red_b("\nSorry, that's not the correct input:\n\tPlease refer to the instructions for the input method"))
      Output.print_input_error
      take_input
      return
    end
  end

  def give_feedback(p_input = @guess)
    if GameStatus.game_over?(@guesses_left)
      quit_plz
    end

    puts("I haven't coded the feedback yet :)")
    next_command('feedback')
  end

  def prompt_start
    system 'clear'
    if first_time
      print(Colors.green_b('Would you like to begin? [y/n]'))
    else
      print(Colors.green_b('Would you like to go again? [y/n]'))
    end
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

  def validate_input(p_input)
    # note to self: imlpement map to replace this
    p_input.each do |value|
      if /[1-6]/ === value.to_s
        # do nothing
      else
        return false
      end
    end
  end

  def quit_plz
    GameStatus.game_end
  end
end
