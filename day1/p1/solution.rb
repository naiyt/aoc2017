def captcha(nums)
  nums.each_with_index.reduce(0) do |sum, (num, i)|
    next_num = i == nums.length - 1 ? nums[0] : nums[i+1]
    sum + (num == next_num ? next_num : 0)
  end
end

nums = File.read('input.txt').split('').map(&:to_i)
p captcha(nums)
