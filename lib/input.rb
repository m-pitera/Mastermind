require './output'
require './game_status'
require './code'
require './ai'

class Input
  class << self
    def takeInput(type)
      the_input = gets.chomp
      if type.eql? 'game_type'
        prompt_game_type
      elsif type.eql? 'user_guess'
        Code.compare(the_input)
      end
    end

    def start_gen_type
      prompt_secret_code
      AI.solve
    end

    def start_guess_type

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

  def prompt_game_type
    Output.print_game_type_prompt
    if gets.chomp.downsize.eql? 'gen'
      start_gen_type
      # user is prompted to generate code and the computer guesses
    elsif gets.chomp.downsize.eql? 'guess'
      start_guess_type
      # user is given instructions
      # user is prompted for guess
      # ^ these two can be private methods that are called within a method called here
    end
  end

  def prompt_secret_code
    Output.print_code_prompt
    gets.chomp
    # would send to Code class in order to assess whether valid
  end
end
