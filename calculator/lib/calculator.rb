# frozen_string_literal: true
require_relative 'calculator/tokenizer'
require_relative 'calculator/token'
require_relative 'calculator/evaluator'

module Calculator
  def self.evaluate(string)
    Evaluator.new.evaluate string
  end
end
