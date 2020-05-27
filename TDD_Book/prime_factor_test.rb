require 'minitest/autorun'
require 'prime'
require_relative 'eratosthenes_test'

class PrimeFactor
  def initialize(number)
    @number = number
  end

  def calculate
    result = []
    current_prime = 2
    until Prime.prime?(@number)
      if @number % current_prime == 0
        result << current_prime
        @number = @number / current_prime
      else
        current_prime = Erastosthenes.next(current_prime)
      end
    end
    result << @number
    result
  end
end

describe PrimeFactor do
  it 'should return 2 for input 2' do
    prime_factorual = PrimeFactor.new(2)
    result = prime_factorual.calculate()
    assert_equal [2], result
  end

  it 'should return 3 for input 3' do
    prime_factorual = PrimeFactor.new(3)
    result = prime_factorual.calculate()
    assert_equal [3], result
  end

  it 'should return [2, 2] for input 4' do
    prime_factorual = PrimeFactor.new(4)
    result = prime_factorual.calculate()
    assert_equal [2, 2], result
  end

  it 'should handle any number' do
    prime_factorual = PrimeFactor.new(168)
    result = prime_factorual.calculate()
    assert_equal [2, 2, 2, 3, 7], result
  end
end
