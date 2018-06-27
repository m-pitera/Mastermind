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
