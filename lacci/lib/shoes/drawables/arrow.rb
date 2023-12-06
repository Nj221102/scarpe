# frozen_string_literal: true

class Shoes
  class Arrow < Shoes::Drawable
    shoes_style :draw_context
    shoes_events # No Arrow-specific events yet

    [:left, :top, :width].each do |prop|
      shoes_style(prop) { |val| val.is_a?(Hash) ? val : convert_to_integer(val, prop) }
    end

    init_args :left, :top, :width
    def initialize(*args, **kwargs)
      @draw_context = Shoes::App.instance.current_draw_context

      super

      create_display_drawable
    end

    def self.convert_to_integer(value, attribute_name)
      begin
        value = Integer(value)
        raise Shoes::Errors::InvalidAttributeValueError, "Negative number '#{value}' not allowed for attribute '#{attribute_name}'" if value < 0

        value
      rescue ArgumentError
        error_message = "Invalid value '#{value}' provided for attribute '#{attribute_name}'. The value should be a number."
        raise Shoes::Errors::InvalidAttributeValueError, error_message
      end
    end
  end
end
