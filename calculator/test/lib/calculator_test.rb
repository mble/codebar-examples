# frozen_string_literal: true
require_relative '../test_helper'
require './lib/calculator'

class CalculatorTest < Minitest::Test
  def setup
  end

  def test_calculator_calculates_infix_expression
    assert_equal 4.0, Calculator.evaluate('2 + 2')
  end
end
