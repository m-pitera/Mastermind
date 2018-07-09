
module Validate
  def is_valid?
    if !length_valid; end

    if !context_valid; end

    if !type_valid; end
  end

    private

  def length_valid; end

  def context_valid; end

  def type_valid; end
end
