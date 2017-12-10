defmodule Day4 do
  def passphrase_valid?(passphrase) do
    words = passphrase |> String.split(~r/\s+/, trim: true)
    sorted_words = Enum.map(words, fn(word) ->
      String.split(word, "", trim: true) |> Enum.sort |> Enum.join("")
    end)

    Enum.uniq(sorted_words) == sorted_words
  end

  def count_valid_passphrases(passphrases) do
    Enum.count(passphrases, fn(passphrase) -> passphrase_valid?(passphrase) end)
  end
end

{:ok, input} = File.read("input.txt")

passphrases = String.split(input, "\n", trim: true)
IO.inspect(Day4.count_valid_passphrases(passphrases))
