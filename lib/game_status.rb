require_relative 'output'
require_relative 'game_functions'

module GameStatus
  # will have 0 params once I implement a class that holds all in-game info
  # this is a temporary fix
  def game_over?(guesses_left)
    if win?
      GameFunctions.game_win
    elsif !guesses_left?(guesses_left)
      GameFunctions.game_lose
    end
  end

    private

  def guesses_left?(guesses_left)
    guesses_left.positive?
  end

  def win?
    false # u can't win yet x)
  end
end
