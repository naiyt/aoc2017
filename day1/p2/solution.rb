def captcha(nums)
  nums.each_with_index.reduce(0) do |sum, (num, i)|
    next_index = ((nums.length / 2) + i) % nums.length
    sum + (num == nums[next_index] ? nums[next_index] : 0)
  end
end

nums = File.read('input.txt').split('').map(&:to_i)
p captcha(nums)
