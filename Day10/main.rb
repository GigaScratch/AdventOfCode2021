
syntaxStack = Array.new
errorScore = 0

File.foreach("Day10/input.txt").each_with_index do |line, index|
    
    line.chars.each do |syntax|
        
        #Add new block to end of array
        if syntax == "(" or syntax == "[" or syntax == "{" or syntax == "<" then syntaxStack.push(syntax); next end

        #pops syntax block if complete - errors out line if unexpected.
        case syntax
            when ")"
                if syntaxStack.last == "(" then syntaxStack.pop else 
                    puts "Syntax error found on line #{index}. Unexpected \"#{syntax}\" found."  
                    errorScore += 3
                    break 
                end 
            when "]"
                if syntaxStack.last == "[" then syntaxStack.pop else
                    puts "Syntax error found on line #{index}. Unexpected \"#{syntax}\" found."
                    errorScore += 57
                    break 
                end 
            when "}"
                if syntaxStack.last == "{" then syntaxStack.pop else
                    puts "Syntax error found on line #{index}. Unexpected \"#{syntax}\" found."  
                    errorScore += 1197
                    break
                end
            when ">"
                if syntaxStack.last == "<" then syntaxStack.pop else
                    puts "Syntax error found on line #{index}. Unexpected \"#{syntax}\" found."  
                    errorScore += 25137
                    break
                end
        end           
    end
end

puts "Total error score is: " + errorScore.to_s