
require 'benchmark'

string = ""

File.open('abc.txt', 'r') do |f|
  string = f.read
end

def count_abc(string)
  working_string = string.reverse
  a_total = 0
  b_total = 0
  end_total = 0
  working_string.each_char do |character|
    if character == 'c'
      b_total +=1
    elsif character == 'b'
      a_total += b_total
    elsif character == "a"
      end_total += a_total
    end
  end
  end_total
end

6.times {puts Benchmark.measure {puts count_abc(string)}}
