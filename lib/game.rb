class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
       @player_1 = player_1
       @player_2 = player_2
       @board = board
    end

    def current_player
        if self.board.cells.count(" ") % 2 != 0
            @player_1 
        else
            @player_2  
        end
    end

    def won?
        WIN_COMBINATIONS.each do |wins|
            if self.board.cells[wins[0]] == "X" && self.board.cells[wins[1]] == "X" && self.board.cells[wins[2]] == "X" 
                return wins
            elsif self.board.cells[wins[0]] == "O" && self.board.cells[wins[1]] == "O" && self.board.cells[wins[2]] == "O"
                return wins
            end
        end
        false
    end

    def draw?
        if self.board.full? && won? == false
            true
        else 
            false
        end
    end

    def over?
        if draw? || won?
            true
        end
    end

    def winner  
        if won?
            self.board.cells[won?.to_a[0]]
        else
            nil
        end
    end

    def turn
        if self.current_player == @player_1 
            input = nil
            until self.board.valid_move?(input) 
                self.board.display
                print "(Player 1) Enter your move(1-9): "
                input = self.player_1.move(@board)
            end
            self.board.update(input, @player_1)
        else
            input = nil
            until self.board.valid_move?(input) 
                self.board.display
                print "(Player 2) Enter your move(1-9): "
                input = self.player_2.move(@board)
            end
            self.board.update(input, @player_2)
        end
    end

    def play
        until over?
            self.turn
        end
        if won?
            self.board.display
            puts "Congratulations #{winner}!"
        elsif draw?
            self.board.display
            puts "Cat's Game!"
        end
    end
    
end