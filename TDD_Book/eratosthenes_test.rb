require 'minitest/autorun'

class Erastosthenes
  def initialize(limit)
    @limit = limit
    @list = (2..@limit).to_a
  end

  def number_list
    (2..@limit).to_a
  end

  def self.next(n)
    e = Erastosthenes.new(100)
    primes = e.calculate()
    primes.detect { |x| x > n }
  end

  def calculate
    list = number_list
    list.each do |x|
      unless x >= Math.sqrt(@limit)
        cross_out_multiples_of(x)
      end
    end

    @list
  end

  private

  def cross_out_multiples_of(number)
    @list.reject! do |x|
      unless x == number
        x % number == 0
      end
    end
  end
end

describe Erastosthenes do
  it 'makes a list of all integers <= 30 andd greater than 1' do
    e = Erastosthenes.new(30)
    result = e.number_list
    expected = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    assert_equal expected, result
  end

  it 'should calculate the prime numbers for 30' do 
    e = Erastosthenes.new(30)
    result = e.calculate
    expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    assert_equal expected, result
  end
end
