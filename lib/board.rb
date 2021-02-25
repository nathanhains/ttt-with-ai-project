class Board
    attr_accessor :cells

    def initialize
        self.reset!
    end

    def reset!
        self.cells = [" "," "," "," "," "," "," "," "," "]
    end

    def display
        puts ""
        if turn_count == 0
            puts "Game Start"
        else
            puts "Turn# #{turn_count}"
        end
        puts ""
        puts (" #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} ")
        puts ("-----------")
        puts (" #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} ")
        puts ("-----------")
        puts (" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} ")
        puts ""
    end

    def position(user_input)
        board_index = user_input.to_i - 1
        self.cells[board_index]
    end

    def full?
        i = 0
        self.cells.collect do |positions|
            if positions == "O" || positions == "X"
                i+=1
            end
        end
        i == 9 ? true : false
    end

    def turn_count
        i = 0
        self.cells.collect do |positions|
            if positions == "O" || positions == "X"
                i+=1
            end
        end
        i
    end

    def taken?(user_input)
        board_index = user_input.to_i - 1
        if self.cells[board_index] == "X" || self.cells[board_index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(user_input)
        if taken?(user_input) == false && user_input.to_i >= 1 && user_input.to_i <=9
            true
        else
            false
        end
    end

    def update(user_input, player)
        board_index = user_input.to_i - 1
        self.cells[board_index] = player.token
    end

end