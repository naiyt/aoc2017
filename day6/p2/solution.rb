# This solution is inelegant and inefficient, but it's late and I'm tired!

# Pretty similar to P1; but instead of storing true
# in our cache we store the index of when we first
# saw that pattern.

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
    current_state = banks.join
    return reallocations - seen[current_state] if seen[current_state]
    seen[current_state] = reallocations
    reallocations += 1
  end
end

input = File.read('input.txt').split("\s").map(&:to_i)
p reallocations_until_dupe(input)
