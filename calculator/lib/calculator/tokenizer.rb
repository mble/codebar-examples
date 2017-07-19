# frozen_string_literal: true
require_relative 'token'

module Calculator
  class Tokenizer
    RULES = {
      /\d+/ => :int,
      /[\/\*\+\-]/ => :op
    }

    def initialize
      @tokens = []
    end

    def parse(string)
      @buffer = StringScanner.new string

      until @buffer.eos?
        skip_spaces
        read_tokens
      end

      @tokens
    end

    private

    def skip_spaces
      @buffer.skip(/\s+/)
    end

    def read_tokens
      RULES.each { |regex, ident| find_token regex, ident }
    end

    def find_token(regex, ident)
      token = @buffer.scan regex
      @tokens << Token.new(token, ident) if token
    end
  end
end
