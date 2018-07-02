require './output'
require './game_status'
require './code'
require './ai'

class Input
  class << self
    def takeInput(type)
      the_input = gets.chomp
      if type.eql? 'user_guess'
        Code.compare(the_input)
      # elsif type.eql? ''

      end
    end
  end

    private

  def is_quit?(input)
    if input.downsize.eql? 'quit'
      Output.print_confirmation
      if gets.chomp.downsize.eql? 'y'
        GameStatus.quit
      else
        return
      end
    end
  end
end
