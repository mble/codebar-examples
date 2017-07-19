# frozen_string_literal: true
require_relative '../../test_helper'
require 'calculator/token'

module Calculator
  class TokenTest < Minitest::Test
    def setup
    end

    def test_must_correctly_coerce_numeric_value
      assert_equal 1.0, Token.new(:int, '1').value
    end

    def test_must_not_coerce_non_numeric_value
      assert_equal '+', Token.new(:opt, '+').value
    end
  end
end
