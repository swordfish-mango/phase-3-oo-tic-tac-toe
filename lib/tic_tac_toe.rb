class TicTacToe
    @board
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize
        @board = Array.new(9," ")
    end

    def display_board
        puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
        puts("-----------")
        puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
        puts("-----------")
        puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
    end

    def input_to_index(num)
        num.to_i - 1
    end

    def move(index,char)
        @board[index] = char
    end


    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        if(index<0 || index >8)
            return false
        else
            return !self.position_taken?(index)
        end
    end

    def turn_count
        9 - @board.count(" ")
    end

    def current_player
        self.turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn
        input = gets
        index=input_to_index(input)
        if(valid_move?(index))
            move(index,current_player)
            display_board
        end
    end

    def full?
        @board.count(" ")==0
    end

    def over?
        self.won? ||self.full?
    end

    def draw?
        self.full? && !self.won?
    end

    def winner
        res = @board[self.won?[0]]
        if res == " "
            nil
        else
            res
        end
    end

    def won?
        combo = WIN_COMBINATIONS.filter {|el| (@board[el[0]]==@board[el[1]] && @board[el[1]] == @board[el[2]])}
        if combo.length == 0
            return false
        else
            return combo[0]
        end
    end

    def play
        while !self.over?
            turn
            if self.won?
                puts "Congratulations #{winner}"
            end
            if self.draw?
                puts "Cat's Game!"
            end
        end
    end

end

