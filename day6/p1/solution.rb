# This solution is inelegant and inefficient, but it's late and I'm tired!

def reallocations_until_dupe(banks)
  seen = {}
  current_state = banks.join
  reallocations = 0

  while true
    # getting max of the reversed list means that the max
    # earlier in the bank wins a tie
    max_index = (banks.reverse.each_with_index.max[1] + 1) * -1
    max_value = banks[max_index]
    curr_index = max_index + 1
    banks[max_index] = 0
    while max_value > 0
      banks[curr_index % banks.length] += 1
      max_value -= 1
      curr_index += 1
    end
    reallocations += 1
    current_state = banks.join
    break if seen[current_state]
    seen[current_state] = true
  end

  reallocations
end

input = File.read('input.txt').split("\s").map(&:to_i)
p reallocations_until_dupe(input)
