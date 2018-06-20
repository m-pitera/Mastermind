#no structure yet, just drafting some logic

class Game
  attr_reader :guess
  attr_reader :code

  def take_input()
    print("What is your guess?\n\t>>>")
    theInput = gets.split(" ")

    if(check_input(theInput))
      @guess = theInput
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
    p_input.each do |value|
      if(value.is_a? Integer)
        if(value)

        end
      end
    end
  end

end

new_game = Game.new
new_game.take_input()
puts new_game.guess
new_game.gen_secret_code()
puts new_game.code
