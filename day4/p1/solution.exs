defmodule Day4 do
  def valid_passphrases(passphrases) do
    Enum.count(passphrases, fn(passphrase) ->
      split_p = String.split(passphrase, ~r/\s+/, trim: true)

      map = Enum.reduce(split_p, %{}, fn(word, map) ->
        map = Map.put_new(map, word, 0)
        Map.put(map, word, map[word] + 1)
      end)

      Enum.all?(map, fn({_, v}) -> v == 1 end)
    end)
  end
end

{:ok, input} = File.read("input.txt")

passphrases = String.split(input, "\n", trim: true)
IO.inspect(Day4.valid_passphrases(passphrases))
