require_relative 'user'
require_relative 'game_status'
require_relative 'colors'
require_relative 'secret_code'
require_relative 'output'

# infinite refactoring in progress
# ironically it's messier than ever before

def main
  include GameStatus
  the_user = User.new

  if the_user.prompt_start.downcase.eql? 'y'
    #game continues to begin
  else
    puts(Colors.colorize('Why not tho?', 'cyan_b'))
    exit(0)
  end

  Output.print_intro
  the_secret_code = SecretCode.new
  the_secret_code.compare_to_guess(the_user.take_input)
  ask_again(the_user, the_secret_code)
end

def ask_again(user, code)
  GameStatus.game_over?(user.guesses_left)
  code.compare_to_guess(user.take_input)
  again(user, code)
end

if __FILE__ == $PROGRAM_NAME
  main
end
