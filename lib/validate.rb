
module Validate
  def is_valid?
    valid = true
    errors = []

    if !length_valid
      valid = false
      errors << 'length'
    end

    if !type_valid
      valid = false
      errors << 'type'
    end

    if !context_valid
      valid = false
      errors << 'context'
    end

    if !valid
      Output.print_errors

      errors.each do |error|
        if error.eql 'length'
          Output.print_length_error
        elsif error.eql 'type'
          Output.print_type_error
        elsif error.eql 'context'
          Output.print_context_error
        end
      end
    end
  end

    private

  def length_valid; end

  def context_valid; end

  def type_valid; end
end
