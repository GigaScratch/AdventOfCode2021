
simpleDigits = 0

File.foreach("Day8/input.txt").each do |line| 
    input = line.split("|")
    input[1].split(" ").each do |digit| 
        

        case digit.length
            when 2
                simpleDigits += 1 
            when 4
                simpleDigits += 1 
            when 3
                simpleDigits += 1 
            when 7 
                simpleDigits += 1 
        end
    end 
end

puts "The total amount of 1's, 4's, 7's and 8's is " + simpleDigits.to_s