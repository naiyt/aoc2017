# This is my first Elixir program, no judging

{:ok, input} = File.read("input.txt")

nums = input
|> String.split("", trim: true)
|> Enum.map(fn(num) -> String.to_integer(num) end)

{result, _} = nums
|> Enum.reduce({0, 0}, fn(num, {agg, i}) ->
  next_num = if (i == length(nums) - 1), do: Enum.at(nums, 0), else: Enum.at(nums, i+1)
  to_sum = if (num == next_num), do: next_num, else: 0
  {agg+to_sum, i+1}
end)

IO.inspect(result)
