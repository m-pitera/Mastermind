# no structure yet, just drafting some logic
# will split up into dif methods in the future

class Game
  attr_reader :guess, :code, :guesses_left, :firstTime

  def initialize
    @guesses_left = 10
    @code = gen_secret_code
    @guess = ''
    @firstTime = true
  end

  # This is just testing methods and etc
  # most of this was used for debugging and etc
  def main

    introduce_user
    take_input
    puts @guess
    gen_secret_code
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
    puts('*******************************')
    puts('***!!Welcome to Mastermind!!***')
    puts('*******************************')
    puts("\n\tThe rules are simple, the Computer will generate a secret code that you will have to guess. There are 6 colors with the code containing 4 colors in which the order matters.\n\n\tYou will input your guesses in the form of \"[color] [color] [color] [color]\". In which you have 6 color options: Red('r'), Orange('o'), Yellow('y'), Green('g'), Blue('b'), Purple('p'). (Atm your input will be taken in numbers instead with the numbers 1-6 referring to the colors in the respective order previously mentioned) \n\n\tThe computer will give you feedback in the form of \"[peg type] [peg type] [peg type] [peg type]\" in which the peg type will either be white, red, or none: \n\t\tWhite: Your guess is the right color, but wrong position.\n\t\tRed: Your guess is at the right color and the right position.\n\t\tNone: This color is not part of the secret code\n\n\tYou win if you are able to guess the code within 10 tries, otherwise the computer wins. You can quit the game after anytime that you receive feedback by typing 'quit'.")
  end

  def take_input
    print("What is your guess?\n\t>>>")
    the_input = gets.split(' ')
     print("#{the_input}\n")

    if (validate_input(the_input))
      @guess = the_input
      @guesses_left -= 1
    else
      puts("Sorry, that's not the correct input, please refer to the instruction for the input method")
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

  def give_feedback(p_input = @guess)
  end

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
  def check_game_status

  end

  # post-game prompts user whether they'd like to try again
  def game_end
    puts('Thanks for playing!')
    exit(0)
  end

  def prompt_start
    reponse = ''
    if firstTime
      print('Would you like to begin? [y/n]')
      reponse = gets
      if response.eql? 'y'
        #the game restarts
      else
        game_end
      end
    else
      print('Would you like to go again? [y/n]')
    end

  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def red(text); colorize(text, 91); end
  def orange(text); colorize(text, 33); end
  def yellow(text); colorize(text, 93); end
  def green(text); colorize(text, 92); end
  def blue(text); colorize(text, 94); end
  def purple(text); colorize(text, 95); end

end

new_game = Game.new
new_game.main
