
inputs = File.read("./day1.txt").split("\n")

part1 = inputs.map{ |row| row.split.map(&:to_i) }.transpose.map(&:sort).transpose.map{|pair| pair.reduce(:-).abs}.reduce(:+)

puts part1

list1, list2 = inputs.map{ |row| row.split.map(&:to_i) }.transpose.map(&:sort).map(&:tally)

puts list1.map{|k,v| (k * list2[k].to_i) * v }.reduce(:+)
