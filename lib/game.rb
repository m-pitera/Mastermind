#no structure yet, just drafting some logic
#will split up into dif methods in the future

class Game
  attr_reader :guess
  attr_reader :code
  attr_reader :guesses_left

  def initialize()
    @guesses_left = 10
    @code = gen_secret_code
    @guess = ""

  end

  def take_input()
    print("What is your guess?\n\t>>>")
    the_input = gets.split(" ")
    #print(the_input + "\n")

    if(check_input(the_input))
      @guess = the_input
      @guesses_left -= 1
    else
      puts("Sorry, that's not the correct input, please refer to the instruction for the input method")
      take_input()
    end
  end

  def gen_secret_code
    randomness = Random.new
    @code = Array.new(4, 0)

    for i in 0..5
      code[i] = randomness.rand(1..6)
    end
  end

  def give_feedback(p_input = @guess)

  end

  def check_input(p_input)
    puts p_input
    p_input.each do |value|
      puts "this is the val: " + value
      if /[1-6]/ === value.to_s
        #do nothing
      else
        return false
      end
    end
  end

  #checks if the game is over and tells the user how many guesses they have left
  def check_game_status()

  end

  #post-game prompts user whether they'd like to try again
  def game_end()

  end

end


#This is just testing methods and etc
new_game = Game.new
new_game.take_input()
puts new_game.guess
new_game.gen_secret_code()
puts new_game.code


# # num = 1111
# # puts num
# # number = num.to_s.split(//)
#
# new_var = ["b", "r", "u", "h"]
# #puts number
# # isCorrect = new_game.check_input(number)
# isCorrect = new_game.check_input(new_var)
# puts isCorrect
