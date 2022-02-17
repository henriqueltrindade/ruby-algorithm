require 'benchmark'
require 'byebug'

# Program for Fibonacci numbers
def fib(n)
  return n if (n <=1)
  return fib(n-1) + fib(n-2)
end

def fib2(n)
  memo = {}
  return fibDynamic(n, memo)
end

def fibDynamic(number, memo)
  return number if (number <=1)
  if memo[number] == nil
    memo[number] = fibDynamic(number - 1, memo) + fibDynamic(number - 2, memo)
  end
  memo[number]
end

puts "1 - teste \n"

@number = 36
time1 = Benchmark.measure {
  puts "low -> Input.: n = #{@number}" 
  puts "low -> Output: #{fib(@number)}"
}
puts "low -> Time: #{time1}"

puts "2 - teste \n"

time2 = Benchmark.measure {
  puts "fast -> Input.: n = #{@number}" 
  puts "fast -> Output: #{fib2(@number)}"
}
puts "fast -> Time: #{time2}"

# maior substring entre as strings

def longestCommomSubstring(str1, str2)
  max_substring = ''
  (0..str1.length).to_a.each do |s1_i|
    (0..str1.length).to_a.each do |s1_j|
      sub_s1 = str1[s1_i..s1_j]
      max_substring = sub_s1 if str2.index(sub_s1) && sub_s1.length > max_substring.length
    end
  end
  max_substring
end

puts "Teste -> longestCommomSubstringDynamic \n"

def longestCommomSubstringDynamic(str1, str2)
  max_len = 0
  ending_index = str1.length
  lookup = Array.new(str1.length, nil)
  (1..str1.length).to_a.each do |row|
    lookup[row] = Array.new(str2.length, 0)
    lookup[row-1] ||= Array.new(str2.length, 0)
    (1..str2.length).to_a.each do |col|
      if (str1[row - 1] == str2[col -1])
        lookup[row][col] = lookup[row-1][col-1] + 1
        if (lookup[row][col] > max_len)
          max_len = lookup[row][col]
          ending_index = row
        end
      end
    end
  end
  str1[ending_index - max_len, ending_index]
end

@str1 = ('a'..'z').to_a.join() * 10
@str1.insert(50, '123455')

@str2 = "A" * 50 * 10
@str2.insert(20, '123455')

@str1 = 'badada1234fdasdfasdf' * 50
@str2 = 'dabc1234xafasdfagh' * 50

puts "Input.: str1 = #{@str1} \n"
puts "Input.: str2 = #{@str2} \n"

time2 = Benchmark.measure {
  puts "low -> Output: #{longestCommomSubstring(@str1, @str2)}"
}
puts "low -> Time: #{time2}"

time2 = Benchmark.measure {
  puts "fast -> Output: #{longestCommomSubstringDynamic(@str1, @str2)}"
}
puts "fast -> Time: #{time2}"
