inputs = File.read("./day1.txt").split("\n").map{|row| row.split.map(&:to_i)}.transpose.map(&:sort)

puts inputs.transpose.map{|pair| pair.reduce(:-).abs}.reduce(:+)

list1, list2 = inputs.map(&:tally)

puts list1.map{|k,v| (k * list2[k].to_i) * v }.reduce(:+)
