require './colors'
require './code'
require './game_status'
require './input'

class Output
  class << self
    TITLE_STARS = Colors.yellow_b('*******************************').center(85)
    TITLE = Colors.yellow_b('*****') + Colors.red_b('Welcome to Mastermind') + Colors.yellow_b('*****').center(103)
    RULES = """
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
    """
    GUESSES_LEFT = "\nGuesses left: "
    INPUT_PROMPT = "What is your guess?\n\t" + Colors.purple_b('>>>')
    INPUT_ERROR = Colors.red_b("\nSorry, that's not the correct input:\n\tPlease refer to the instructions for the input method")
    CODE_GENERATED = Colors.blue_b('The secret code has been generated, you may begin . . .')
    GAME_BEGIN = Colors.green_b('Would you like to begin? [y/n]')
    GAME_AGAIN = Colors.green_b('Would you like to go again? [y/n]')
    NO_GUESSES = Colors.red_b('Nice try, but you ran out of guesses :(')
    GAME_MODE_PROMPT = Colors.green_b('Would you like to generate the code or guess it? [gen/guess]')

    def print_game_type_prompt
      print GAME_MODE_PROMPT
    end

    def print_intro
      puts ''
      header
      instructions
      type_ok
      system 'clear'
    end

    def print_start_again(first_time_p = false)
      if first_time_p
        print GAME_BEGIN
      else
        print GAME_AGAIN
      end
    end

    def print_input_prompt(guesses_left)
      puts GUESSES_LEFT + Colors.cyan(guesses_left.to_s)
      print INPUT_PROMPT
      return gets.chomp
    end

    def print_no_guesses
      puts NO_GUESSES
    end

    def print_the_code(code)
      puts THE_ANSWER + Colors.yellow_b(code.join(' '))
    end

    def print_input_error
      puts INPUT_ERROR
    end

    def print_code_generated
      puts CODE_GENERATED
    end

      private

    def instructions
      puts RULES
    end

    def header
      puts TITLE_STARS
      puts TITLE
      puts TITLE_STARS
    end

    def type_ok
      print "Type 'ok' to continue: "
      response = gets.chomp
      type_ok unless response.casecmp('ok').zero?
      return
    end
  end
end
