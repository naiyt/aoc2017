def count_valid_passphrases(passphrases)
  passphrases.count do |passphrase|
    passphrase.split("\s").each_with_object({}) do |w, hash|
      hash[w] ||= 0
      hash[w] += 1
    end.values.all? { |i| i == 1 }
  end
end

passphrases = File.read('input.txt').split("\n")
puts count_valid_passphrases(passphrases)
