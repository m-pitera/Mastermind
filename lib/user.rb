require './output'
require './colors'

# User class knows too much, i made a mess and now refactoring
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

    the_input = is_quit?(the_input)

    if (validate_input(the_input))
      @guess = the_input
      @guesses_left -= 1
      next_command('input')
      return
    else
      # Output.print_input_error
      take_input
      return
    end
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

  def validate_input(p_input)
    # note to self: imlpement map to replace this

    # this doesn't work
    # if p_input.all? { |i| i.between?(1, 6) }  false
    #   return false
    # end

    p_input.each do |value|
      if !(/[1-6]/ === value.to_s)
        return false
        Output.print_num_error
        break
      end
    end

    if p_input.length != 4
      return false
      Output.print_out_of_bounds_error
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
