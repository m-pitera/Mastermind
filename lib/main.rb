require_relative './input'
require_relative './output'

def main
  Input.takeInput('game_type')
end

if __FILE__ == $PROGRAM_NAME
  main
end
