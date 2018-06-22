# no structure yet, just drafting some logic
# will split up into dif methods in the future

class Game
  attr_reader :guess, :code, :guesses_left, :first_time

  def initialize
    @guesses_left = 10
    @code = gen_secret_code
    @guess = ''
    @first_time = true
  end

  # This is just testing methods and etc
  # most of this was used for debugging and etc
  def main
    introduce_user
    gen_secret_code
    take_input
    # puts @guess
    # puts @code

    # puts('testing colors')
    # puts(red('red'))
    # puts(orange('orange'))
    # puts(yellow('yellow'))
    # puts(green('green'))
    # puts(blue('blue'))
    # puts(purple('purple'))

    # # num = 1111
    # # puts num
    # # number = num.to_s.split(//)
    #
    # new_var = ["b", "r", "u", "h"]
    # #puts number
    # # isCorrect = new_game.validate_input(number)
    # isCorrect = new_game.validate_input(new_var)
    # puts isCorrect
  end

  def introduce_user
    system 'clear'
    title1 = yellow_b('*******************************')
    title2 = yellow_b('*****') + red_b('Welcome to Mastermind') + yellow_b('*****')
    title3 = yellow_b('*******************************')
    puts('')
    puts(title1.center(85))
    puts(title2.center(103))
    puts(title3.center(85))
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
    feedback by typing 'quit'.""")
  end

  def take_input
    puts("\nYou have " + cyan(guesses_left) + ' guesses left')
    print("What is your guess?\n\t" + purple_b('>>>'))
    the_input = gets.split(' ')
    print("#{the_input}\n")

    if validate_input(the_input)
      @guess = the_input
      @guesses_left -= 1
    else
      # further into dev I might check and return for specific cases of incorrect input
      puts("Sorry, that's not the correct input, please refer to the instruction
        for the input method")
      take_input
    end
  end

  def gen_secret_code
    randomness = Random.new
    @code = (1..4).map { |_| randomness.rand(1..6) }
    # @code = Array.new(4, 0)
    #
    # for i in 0..5
    #   code[i] = randomness.rand(1..6)
    # end
  end

  def give_feedback(p_input = @guess); end

  def evaluate_guess; end

  def validate_input(p_input)
    puts p_input

    # note to self: imlpement map to replace
    p_input.each do |value|
      # puts ("this is the val: #{value}")
      if /[1-6]/ === value.to_s
        # do nothing
      else
        return false
      end
    end
  end

  # checks if the game is over
  # tells the user how many guesses they have left
  def check_game_status; end

  # post-game prompts user whether they'd like to try again
  def game_end
    puts('Thanks for playing!')
    exit(0)
  end

  def prompt_start
    if first_time
      print('Would you like to begin? [y/n]')
    else
      print('Would you like to go again? [y/n]')
    end
    response = gets.chomp

    if response == 'y'
      main
      # the game starts
    else
      game_end
    end
  end

  #colors
  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

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
end

new_game = Game.new
new_game.prompt_start
