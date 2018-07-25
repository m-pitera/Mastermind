# Mastermind

## Setup

  In order to run the game simply clone or download the repo and you can run it though "ruby main.rb" when within the repo's lib directory

  After cloning or installing the repo, when in the root directory, you can run the game with:

  `ruby main.rb`

## Running Specs

  You can run specs by running this command while in the root directory:

  `rspec`

  Or if you want to test a specific file you can run:

  `rspec path/to/spec/file.rb`

## Current Capabilities

  The game's current capabilities are that it will prompt at start to begin and react accordingly. After the instructions it will process guesses as valid or invalid and give instructions according to what was incorrect. The User will receive feedback, but it is impossible to win the game. After all 10 guesses the secret code will be presented and the user will be prompted whether they'd like to restart. The user may also type 'quit' during the guess phase at any time and the game will exit.
