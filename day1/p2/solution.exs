{:ok, input} = File.read("input.txt")

nums = input
|> String.split("", trim: true)
|> Enum.map(fn(num) -> String.to_integer(num) end)

{result, _} = nums
|> Enum.reduce({0, 0}, fn(num, {agg, i}) ->
  full_index = round((length(nums) / 2) + i)
  next_num = Enum.at(nums, rem(full_index, length(nums)))
  to_sum = if (num == next_num), do: next_num, else: 0
  {agg+to_sum, i+1}
end)

IO.inspect(result)
