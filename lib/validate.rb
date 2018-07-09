require './output'

module Validate
  def is_valid?(the_input)
    valid = true
    errors = []

    if !length_valid(the_input)
      valid = false
      errors << 'length'
    end

    if !type_valid(the_input)
      valid = false
      errors << 'type'
    end

    if !context_valid(the_input)
      valid = false
      errors << 'context'
    end

    if !valid
      Output.print_error_start

      errors.each do |error|
        if error.eql? 'length'
          Output.print_length_error
        elsif error.eql? 'type'
          Output.print_type_error
        elsif error.eql? 'context'
          Output.print_context_error
        end
      end
    end
  end

    private

  def length_valid(the_input)
    return true if the_input.length.eql? 4

    return false
  end

  def type_valid(the_input)
    return true if the_input.all? { |val| val.is_a? Integer}

    return false
  end

  def context_valid(the_input)
    return true if the_input.all? { |val| val.to_i.between?(1, 6) }

    return false
  end
end
