defmodule D2P1 do
  def checksum(matrix) do
    matrix
    |>  Enum.reduce(0, fn(arr, agg) ->
      {min, max} = Enum.min_max(arr)
      agg + (max - min)
    end)
  end
end

{:ok, input} = File.read("input.txt")

matrix = input
|> String.split("\n", trim: true)
|> Enum.map(fn(str) ->
  str
  |> String.split(~r/\s+/, trim: true)
  |> Enum.map(fn(num) -> String.to_integer(num) end)
end)

IO.inspect(D2P1.checksum(matrix))
