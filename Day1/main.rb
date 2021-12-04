
result = 1
File.foreach("Day1/input.txt").each do |line|
    if $. == 1
        $prevLine = line
        next
    end

    if line > $prevLine
        result += 1
    end

    $prevLine = line
end

puts result