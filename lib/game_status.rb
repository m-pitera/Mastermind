require './output'
require './main'

module GameStatus
  include Output
  def guesses_left?(guesses_left)
    if guesses_left.zero?
      game_end
    end
  end

  private

  def game_end
    print_no_guesses
    print_the_code
    print_start_again

    if gets.chomp.downcase.eql? 'y'
      puts 'too bad, thanks for playing though x)'
      exit(0)
    end
    game_exit
  end

  def game_exit
    # system 'clear'
    puts(Colors.cyan_b('Thanks for playing!'))
    exit(0)
  end
end
