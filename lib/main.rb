require './user'
require './game_status'
require './colors'
require './secret_code'
require './output'

# infinite refactoring in progress
# ironically it's messier than ever before

def main
  include GameStatus
  the_user = User.new

  if the_user.prompt_start.downcase.eql? 'y'
    #game continues to begin
  else
    puts(Colors.cyan_b('Why not tho?'))
    exit(0)
  end

  Output.print_intro
  the_secret_code = SecretCode.new
  the_user.take_input
  the_user.give_feedback
end

if __FILE__ == $PROGRAM_NAME
  main
end
