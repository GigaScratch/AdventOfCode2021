

fishies = File.read("Day6/input.txt").split(",").map(&:to_i)
maxDays = 80

maxDays.times {
    newFish = 0
    fishies.each_with_index do | fish, index|
        if fish == 0
            fishies[index] = 6
            newFish +=1
        else
            fishies[index] = fish - 1
        end
    end
    newFish.times{ fishies.push(8) }
}

puts "After " + maxDays.to_s + " days, there were " + fishies.count.to_s + " fish!"
