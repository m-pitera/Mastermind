require_relative 'output'

module Validate
  def is_valid?(the_input)
    valid = true
    errors = []

    if !length_valid(the_input)
      valid = false
      errors << 'length'
    end

    if !context_valid(the_input)
      valid = false
      errors << 'context'
    end

    output_errors(valid, errors)
  end

    private

  def length_valid(the_input)
    the_input.length == 4
  end

  def context_valid(the_input)
    the_input.all? { |val| val.to_i.between?(1, 6) }
  end

  def output_errors(valid, errors)
    if !valid
      Output.print_error_start

      errors.each do |error|
        if error.eql? 'length'
          Output.print_length_error
        elsif error.eql? 'context'
          Output.print_context_error
        end
      end
    end
  end
end
