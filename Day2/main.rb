
pos = 0
depth = 0

File.foreach("Day2/input.txt").each do |line|
    splitInput = line.split
    
    case splitInput[0]
    when "forward"
        pos += splitInput[1].to_i
    when "up"
        depth -= splitInput[1].to_i
    when "down"
        depth += splitInput[1].to_i
    end
end

puts "Position: ".concat(pos.to_s)
puts "Depth: ".concat(depth.to_s)
puts "Puzzle Result: ".concat((pos * depth).to_s)
