# This is slow in Elixir, so I probably need to learn some
# tricks to make list traversal and recursion faster.

defmodule Day5 do
  def num_of_steps(instructions, steps \\ 0, curr_index \\ 0) do
    if curr_index < 0 || curr_index >= Enum.count(instructions) do
      steps
    else
      offset = Enum.at(instructions, curr_index)
      offset_modifier = if offset >= 3, do: -1, else: 1
      next_index = curr_index + offset
      num_of_steps(
        List.replace_at(instructions, curr_index, offset + offset_modifier),
        steps + 1,
        next_index
      )
    end
  end
end

{:ok, input} = File.read("input.txt")
instructions = input
|> String.split("\n", trim: true)
|> Enum.map(fn(num) -> String.to_integer(num) end)

IO.inspect(Day5.num_of_steps(instructions))
