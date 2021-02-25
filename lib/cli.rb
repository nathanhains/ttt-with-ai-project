class CLI
    def call
        hello
    end

    def hello
        puts "Welcome to Tic Tac Toe!"
        count_integer = player_count.to_i
        if count_integer == 0
            game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
            game.play 
        elsif count_integer == 1
            token_capitalize = player_token_single.capitalize
            if token_capitalize == "X"
                game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
                game.play
            elsif token_capitalize == "O"
                game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Computer.new("X"))
                game.play
            end
        elsif count_integer == 2
            token_capitalize = player_token_double.capitalize
            if token_capitalize == "X"
                game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
                game.play
            elsif token_capitalize == "O"
                game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"))
                game.play
            end
        end
    end


    def player_token_double
        print "Player 1: Choose your token (X or O): "
        input = gets.strip
        input
    end


    def player_token_single
        print "Choose your token (X or O): "
        input = gets.strip
        input
    end

    def player_count
        print "Please Enter the amount of players(0-2): "
        input = gets.strip
        input
    end
    
end