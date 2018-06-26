class User
  attr_reader :guess, :guesses_left, :first_time

  def initialize
    @guesses_left = 10
    @guess = ''
    @first_time = true
  end

  def introduce_user
    system 'clear'
    stars = Colors.yellow_b('*******************************')
    title = Colors.yellow_b('*****') + Colors.red_b('Welcome to Mastermind') + Colors.yellow_b('*****')
    puts('')
    puts(stars.center(85))
    puts(title.center(103))
    puts(stars.center(85))
    puts("""
      The rules are simple, the Computer will generate a secret code
    that you will have to guess. There are 6 colors with the code containing
    4 colors in which the order matters.

      You will input your guesses in the form of \"[color] [color] [color]
    [color]\". In which you have 6 color options: Red('r'), Orange('o'),
    Yellow('y'), Green('g'), Blue('b'), Purple('p'). (Atm your input will be
    taken in numbers instead with the numbers 1-6 referring to the colors in
    the respective order previously mentioned)

      The computer will give you feedback in the form of \"[peg type] [peg
    type] [peg type] [peg type]\" in which the peg type will either be white,
    red, or none:
        White: Your guess is the right color, but wrong position.
        Red: Your guess is at the right color and the right position.
        None: This color is not part of the secret code.

      You win if you are able to guess the code within 10 tries, otherwise
    the computer wins. You can quit the game after anytime that you receive
    feedback by typing 'quit'.
    """)
    type_ok
    system 'clear'
  end

  def take_input
    puts("\nYou have " + Colors.cyan(guesses_left) + ' guesses left')
    print("What is your guess?\n\t" + Colors.purple_b('>>>'))
    the_input = gets.chomp

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
      puts(Colors.red_b("\nSorry, that's not the correct input:\n\tPlease refer to the instructions for the input method"))
      take_input
      return
    end
  end

  def give_feedback(p_input = @guess)
    if (GameStatus.get_guesses.eql? 'game_over')
      quit_plz
    end

    puts("I haven't coded the feedback yet :)")
    next_command('feedback')
  end

  def prompt_start
    system 'clear'
    if first_time
      print('Would you like to begin? [y/n]')
    else
      print('Would you like to go again? [y/n]')
    end
    return gets.chomp
  end

  def self.give_guesses
    return guesses_left
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

  def type_ok
    print ("Type 'ok' to continue: ")
    response = gets.chomp
    if response.eql? 'ok'
      return
    else
      type_ok
    end
  end

  def quit_plz
    GameStatus.game_end
  end
end

# *****************************************************************************

module GameStatus

  class << self
    def game_end
      system 'clear'
      puts(Colors.cyan_b('Thanks for playing!'))
      exit(0)
    end

    def game_status
      if get_guesses <= 0
        game_over
        return 'game_over'
      else
        return 'game_continue'
      end
    end

    def game_over
      puts('Nice try, but you ran our of guesses :(')
    end

    def get_guesses
      give_guesses
    end
  end
end

# *****************************************************************************

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

# *****************************************************************************

module Colors
  class << self
    def red(text); colorize(text, 31); end
    def red_b(text); colorize(text, 91); end
    def yellow(text); colorize(text, 33); end
    def yellow_b(text); colorize(text, 93); end
    def green(text); colorize(text, 32); end
    def green_b(text); colorize(text, 92); end
    def blue(text); colorize(text, 34); end
    def blue_b(text); colorize(text, 94); end
    def purple(text); colorize(text, 35); end
    def purple_b(text); colorize(text, 95); end
    def cyan(text); colorize(text, 36); end
    def cyan_b(text); colorize(text, 96); end
    def white(text); colorize(text, 37); end
    def white_b(text); colorize(text, 97); end

    private

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end
  end
end

# *****************************************************************************

def main
  the_user = User.new

  if the_user.prompt_start.eql? 'y'
    #game continues to begin
  else
    GameStatus.game_end
  end

  the_user.introduce_user
  the_secret_code = SecretCode.new
  the_user.take_input
  the_user.give_feedback
end

if __FILE__ == $PROGRAM_NAME
  main
end
