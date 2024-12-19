input = File.read("./day3.txt")

def mul a, b
  a * b
end

puts input.scan(/mul\(\d+,\d+\)/).map{|m| eval(m)}.reduce(:+)

require 'strscan'

@do = true

scanner = StringScanner.new(input)

@vals = []

while !scanner.eos?
  if scanner.scan(/don't/)
    @do = false
  elsif scanner.scan(/do\(\)/)
    @do = true
  elsif scanner.scan(/mul\(\d+,\d+\)/)
    @vals << eval(scanner.matched) if @do
  else
    scanner.pos += 1
  end
end

puts @vals.sum
