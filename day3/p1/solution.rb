# had a bit of trouble, so ended up getting help
# at https://www.reddit.com/r/adventofcode/comments/7h7ufl/2017_day_3_solutions/

def spiral_steps(num)
  shell_start = Math.sqrt(num).ceil
  curR = shell_start % 2 != 0 ? shell_start : shell_start + 1
  numR = (curR - 1) / 2
  cycle = num - ((curR - 2) ** 2)
  innerOffset = cycle % (curR - 1)
  numR + (innerOffset - numR).abs
end

num = File.read('input.txt').to_i
puts spiral_steps(num)
