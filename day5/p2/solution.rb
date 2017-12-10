def num_of_steps(instructions)
  steps = curr_index = next_index = 0
  while curr_index >= 0 && curr_index < instructions.length
    next_index = curr_index + instructions[curr_index]
    instructions[curr_index] += instructions[curr_index] >= 3 ? -1 : 1
    curr_index = next_index
    steps += 1
  end
  steps
end


instructions = File.read('input.txt').split("\n").map(&:to_i)
p num_of_steps(instructions)
