require './output'
require './main'

module GameStatus
  def guesses_left?(guesses_left)
    if guesses_left.zero?
      game_end
    end
  end

    private

  def game_end
    Output.print_no_guesses
    Output.print_the_code
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
