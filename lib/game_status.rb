require './output'

module GameStatus
  class << self

    def guesses_left?(guesses_left)
      if guesses_left.zero?
        game_end
      end
    end

    private

    def game_end
      Output.print_no_guesses
      Output.print_the_code
      game_exit
      # Output.print_start_again
    end

    def game_exit
      # system 'clear'
      puts(Colors.cyan_b('Thanks for playing!'))
      exit(0)
    end
  end
end
