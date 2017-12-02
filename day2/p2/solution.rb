require 'pry'
require 'pry-nav'

def checksum(matrix)
  # This is O(n^2), which sucks. There's probably
  # a clever O(n) solution that's not coming to me.
  sum = 0

  matrix.each do |arr|
    arr[0..-2].each_with_index do |i, index|
      arr[index+1..-1].each do |j|
        min, max = [i, j].minmax
        sum += max / min if max % min == 0
      end
    end
  end

  sum
end

matrix = File.read('input.txt').split("\n").map { |r| r.split("\s").map(&:to_i) }
puts checksum(matrix)
