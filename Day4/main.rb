
$bingoCalls = Array.new
$boards = Array.new
$gameCounters


def setup_Game
    rows = Array.new
    rowCount = 0
    File.foreach("Day4/input.txt").each_with_index do |line, lineIndex|

        #gets the array of bingo numbers to call
        if $. == 1 then $bingoCalls = line.split(",").map(&:to_i); next end

        #defines the index/rows array for the start and end of each bingo board
        if line.strip.empty? then rowCount = -1; rows = Array.new else rowCount += 1 end 
        
        #Fills up rows array and then pushes to board when finished
        if rowCount == -1 then $boards.push(rows) else rows.push(line.split(" ").map(&:to_i)) end

    end

    #Duplicate array structure of boards for number markings
    $gameCounters = Array.new($boards.size) {Array.new(5) {Array.new(5, 0)}}


end


def start_Game
    #Nesting is good for the soul
    $bingoCalls.each do |call|

        #for each board
        $boards.each_with_index do |board, boardIndex|
            #theres a row
            board.each_with_index do |row, rowIndex|
                #with a number
                row.each_with_index do |number, index|
                    #that we need to check
                    if number == call then $gameCounters[boardIndex][rowIndex][index] = 1 end
                end
            end
        end

        #is this victory?
        boardIndex = check_For_Win
        if boardIndex != false then score_Game(call, boardIndex) end
    end

end


def check_For_Win

    $gameCounters.each_with_index do |board, boardIndex|

        #row check
        board.each_with_index do |value, index|
            if value[0] == 1 and value[1] == 1 and value[2] == 1 and value[3] == 1 and value[4] == 1 then return boardIndex end
        end

        #column check
        5.times.with_index do |index|
            if board[0][index] == 1 and board[1][index] == 1 and board[2][index] == 1 and board[3][index] == 1 and board[4][index] == 1 then return boardIndex end
        end

        #angle down diagonal check
        #if board[0][0] == 1 and board[1][1] == 1 and board[2][2] == 1 and board[3][3] == 1 and board[4][4] == 1 then return "down diag"  end
        #angle up diagonal check
        #if board[4][0] == 1 and board[3][1] == 1 and board[2][2] == 1 and board[1][3] == 1 and board[0][4] == 1 then return "up diag" end
    end
    return false
end


def score_Game(call, boardindex)
    scoreSum = 0
    $boards[boardindex].each_with_index do |row, index|
        row.each_with_index do |n, i|
            if $gameCounters[boardindex][index][i] == 0 then scoreSum += $boards[boardindex][index][i] end
        end
    end
    puts "Winning board is board number #{boardindex} with a total score of #{scoreSum * call}."
    exit(true)
end



setup_Game
start_Game



