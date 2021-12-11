
lowRisk = Array.new
length = File.readlines("Day9/input.txt").size
riskArray = Array.new(length) { Array.new  }

File.foreach("Day9/input.txt").each_with_index do |line, lineIndex|
    line.to_i.digits.reverse.each_with_index do |digit, index|
        riskArray[lineIndex][index] = digit.to_i
    end

end

#forgive me father for i have sinned
riskArray.each_with_index do |line, lineIndex|

    puts line.join
    line.each_with_index do |digit, index|       


        if lineIndex == 0
            #top left corner
            if index == 0
                if digit < line[index + 1] and digit < riskArray[lineIndex + 1][index] 
                    lowRisk.push(digit + 1)
               end

            #top right corner
            elsif index == line.rindex(line.last)
                if digit < line[index - 1] and digit < riskArray[lineIndex + 1][index] 
                    lowRisk.push(digit + 1)
                end

            #top line generic
            elsif digit < line[index - 1] and digit < line[index + 1] and digit < riskArray[lineIndex + 1][index] 
                lowRisk.push(digit + 1)
            end  
        
        elsif lineIndex == riskArray.rindex(riskArray.last)
            #bottom left corner
            if index == 0
                if digit < line[index + 1] and digit < riskArray[lineIndex - 1][index] 
                    lowRisk.push(digit + 1)
                end

            #bottom right corner
            elsif index == line.rindex(line.last)
                if digit < line[index - 1] and digit < riskArray[lineIndex - 1][index] 
                    lowRisk.push(digit + 1)
                end
                
            #bottom line generic
            elsif digit < line[index - 1] and digit < line[index + 1] and digit < riskArray[lineIndex - 1][index]  
                lowRisk.push(digit + 1)
            end
        
        elsif index == 0
            if digit < line[index + 1] and digit < riskArray[lineIndex - 1][index] and digit < riskArray[lineIndex + 1][index] 
                lowRisk.push(digit + 1)
            end

        elsif index == line.rindex(line.last)
            if digit < line[index - 1] and digit < riskArray[lineIndex + 1][index] and digit < riskArray[lineIndex - 1][index] 
                lowRisk.push(digit + 1)
            end  

        else
            if digit < line[index - 1] and digit < line[index + 1] and digit < riskArray[lineIndex - 1][index] and digit < riskArray[lineIndex + 1][index] 
                lowRisk.push(digit + 1)
            end  
        end
    end
end

puts "The total risk level sum is: " + lowRisk.sum.to_s
