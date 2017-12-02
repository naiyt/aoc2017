def checksum(matrix)
  matrix.reduce(0) do |agg, arr|
    min, max = arr.minmax # Ruby is great
    agg + (max-min)
  end
end

matrix = File.read('input.txt').split("\n").map { |r| r.split("\s").map(&:to_i) }
puts checksum(matrix)
