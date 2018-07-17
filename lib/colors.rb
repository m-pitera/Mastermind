class Colors
  class << self

    COLOR_CODES = {
      'red' => 31,
      'red_b' => 91,
      'yellow' => 33,
      'yellow_b' => 93,
      'green' => 32,
      'green_b' => 92,
      'blue' => 34,
      'blue_b' => 94,
      'purple' => 35,
      'purple_b' => 95,
      'cyan' => 36,
      'cyan_b' => 96,
      'white' => 37,
      'white_b' => 97,
    }

    def colorize(text, color)
      "\e[#{COLOR_CODES[color]}m#{text}\e[0m"
    end
  end
end
