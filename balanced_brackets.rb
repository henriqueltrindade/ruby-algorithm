require 'byebug'

#
# Complete the 'isBalanced' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def isBalanced(s)
  return 'NO' if s.to_s.strip.length.odd?
  return 'NO' if s.to_s.strip =~ /[^\[\]\(\)\{\}]/

  pairs = { '{' => '}', '[' => ']', '(' => ')' }

  stack = []
  s.chars do |bracket|
    if expectation = pairs[bracket]
      stack << expectation
    else
      return 'NO' unless stack.pop == bracket
    end
  end

  stack.empty? ? 'YES' : 'NO'
end

test0 = 3
puts "#{test0}: #{isBalanced(test0)}"

test1 = '{[()]}'
puts "#{test1}: #{isBalanced(test1)}"

test2 = '{[(])}'
puts "#{test2}: #{isBalanced(test2)}"

test3 = '{{[[(())]]}}'
puts "#{test3}: #{isBalanced(test3)}"
