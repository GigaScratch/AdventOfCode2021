
crabPositions = File.read("Day7 (Birthday 🎂)/input.txt").split(",").map(&:to_i)
optimisedFuelUsage = [0, crabPositions.sum]

crabPositions.max.times { |position|
    totalFuelUsage = 0
    
    crabPositions.each do |crab|
        totalFuelUsage += (position - crab).abs
    end

    if totalFuelUsage < optimisedFuelUsage[1] then optimisedFuelUsage.replace([position, totalFuelUsage]) end
}

puts "The optimal horizontal position is " + optimisedFuelUsage[0].to_s + ", using " +  optimisedFuelUsage[1].to_s + " fuel."




