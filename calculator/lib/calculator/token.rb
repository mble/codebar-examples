# frozen_string_literal: true
module Calculator
  class Token
    attr_reader :ident

    def initialize(ident, value)
      @ident = ident
      @value = value
    end

    def ==(other_token)
      value == other_token.value && ident == other_token.ident
    end

    def value
      Float(@value) rescue @value
    end

    def priority
      case value
      when '+'
        1
      when '-'
        1
      when '*'
        2
      when '/'
        2
      else
        0
      end
    end
  end
end
