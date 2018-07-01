require './user'
require './game_status'
require './colors'
require './secret_code'
require './output'

# note to self: I left off trying to fix an error within Output that did not
# recognize User as a class even with require. If error persists ask someone

# note to self 2: still doesn't work; reeeeeeeeeeeeeeeeeeee

def main
  the_user = User.new

  if the_user.prompt_start.eql? 'y'
    #game continues to begin
  else
    GameStatus.game_end
  end

  Output.print_intro
  the_secret_code = SecretCode.new
  the_user.take_input
  the_user.give_feedback
end

if __FILE__ == $PROGRAM_NAME
  main
end
