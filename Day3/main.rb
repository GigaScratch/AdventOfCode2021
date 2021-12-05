
gamma = ""
epsilon = ""
rowcount = 0

File.foreach("Day3/input.txt").each do |digits|
    if $. == 1 then $onCount = Array.new(digits.length-1, 0) end

    digits.split("").each_with_index do |digit, index|
        if digit.to_i == 0 or index == 12 then next else
            $onCount[index] += 1
        end
    end
    rowcount += 1
end

$onCount.each do |value|
    if value > rowcount/2 then gamma << "1" and epsilon << "0" else gamma << "0" and epsilon << "1" end
end

puts "Gamma Binary Value: " + gamma + " Gamma Decimal Value: " + gamma.to_i(2).to_s
puts "Epsilon Binary Value: " + epsilon + " Epsilon Decimal Value: " + epsilon.to_i(2).to_s
puts "Power Consumption: " + (gamma.to_i(2) * epsilon.to_i(2)).to_s