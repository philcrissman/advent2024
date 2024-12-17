input = File.read("./day2.txt").split("\n").map{|row| row.split.map(&:to_i)}

def safe?(row)
  pairs = row.each_cons(2)
  (pairs.all?{|a,b| a < b} || pairs.all?{|a,b| a>b}) && pairs.map{|cons| cons.reduce(:-).abs}.all?{|diff| diff <= 3}
end

puts input.map { |row| safe?(row) ? 1 : 0 }.reduce(:+)

puts input.map { |row|
  if safe?(row)
    1
  else
    row.combination(row.length - 1).any?{|subset| safe?(subset)} ? 1 : 0
  end
}.reduce(:+)


