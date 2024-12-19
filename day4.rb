input = File.read("day4.txt").split("\n").map{|r| r.split('')}

count = 0

input.each do |row|
  count += row.join.scan("XMAS").count
  count += row.join.reverse.scan("XMAS").count
end

input.transpose.each do |row|
  count += row.join.scan("XMAS").count
  count += row.join.reverse.scan("XMAS").count
end

diagonals = []

require 'matrix'

diagonals << Matrix.rows(input).each(:diagonal).to_a
diagonals << Matrix.rows(input.map(&:reverse)).each(:diagonal).to_a

(1..input.size-3).each do |n|
  diagonals << Matrix.rows(input[n..-1]).each(:diagonal).to_a
  diagonals << Matrix.rows(input.transpose[n..-1]).each(:diagonal).to_a
  diagonals << Matrix.rows(input.map(&:reverse)[n..-1]).each(:diagonal).to_a
  diagonals << Matrix.rows(input.map(&:reverse).transpose[n..-1]).each(:diagonal).to_a
end

diagonals.each do |row|
  count += row.join.scan("XMAS").count
  count += row.join.reverse.scan("XMAS").count
end

puts count

count2 = 0

input[1..-2].each.with_index(1) do |row, y|
  row[1..-2].each.with_index(1) do |cell, x|
    if cell == "A"
      d1 = [input[y-1][x-1], input[y+1][x+1]]
      d2 = [input[y-1][x+1], input[y+1][x-1]]
      if (d1.index("M") && d1.index("S")) && (d2.index("M") && d2.index("S"))
        count2 += 1
      end 
    end
  end
end

puts count2
