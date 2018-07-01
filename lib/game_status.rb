module GameStatus
  class << self
    def game_end
      system 'clear'
      puts(Colors.cyan_b('Thanks for playing!'))
      exit(0)
    end

    def game_over?(guesses_left)
      if guesses_left.zero?
        game_over
        true
      else
        false
      end
    end

    def game_over
      puts(Colors.red_b('Nice try, but you ran out of guesses :('))
    end

    # def get_guesses
    #  give_guesses
    # end
  end
end
