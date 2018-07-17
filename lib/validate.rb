require './output'

module Validate
  include Output
  def is_valid?(the_input)
    valid = true
    errors = []

    if !length_valid(the_input)
      valid = false
      errors << 'length'
    end

    # if !type_valid(the_input)
    #   valid = false
    #   errors << 'type'
    # end

    if !context_valid(the_input)
      valid = false
      errors << 'context'
    end

    if !valid
      print_error_start

      errors.each do |error|
        if error.eql? 'length'
          print_length_error
        # elsif error.eql? 'type'
        #   print_type_error
        elsif error.eql? 'context'
          print_context_error
        end
      end
    end
  end

    private

  def length_valid(the_input)
    the_input.length == 4
  end

  # def type_valid(the_input)
  #   the_input.all? { |val| val.is_a? Integer}
  # end

  def context_valid(the_input)
    the_input.all? { |val| val.to_i.between?(1, 6) }
  end
end
