require './output'

class GameFunctions
  class << self
    def game_win
      Output.print_win
      game_end
    end

    def game_lose
      Output.print_lose
      game_end
    end

    def restart; end

      private

    def game_end
      #this should be moved somewhere, but idk where yet
      Output.print_start_again

      if gets.chomp.downcase.eql? 'y'
        puts 'too bad, thanks for playing though x)'
        exit(0)
      end
      game_exit
    end

    def game_exit
      # system 'clear'
      puts(Colors.colorize('Thanks for playing!', 'cyan_b'))
      exit(0)
    end
  end
end
