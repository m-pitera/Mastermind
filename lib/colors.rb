module Colors
  def red(text); colorize(text, 31); end
  def red_b(text); colorize(text, 91); end
  def yellow(text); colorize(text, 33); end
  def yellow_b(text); colorize(text, 93); end
  def green(text); colorize(text, 32); end
  def green_b(text); colorize(text, 92); end
  def blue(text); colorize(text, 34); end
  def blue_b(text); colorize(text, 94); end
  def purple(text); colorize(text, 35); end
  def purple_b(text); colorize(text, 95); end
  def cyan(text); colorize(text, 36); end
  def cyan_b(text); colorize(text, 96); end
  def white(text); colorize(text, 37); end
  def white_b(text); colorize(text, 97); end

    private

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end
end
