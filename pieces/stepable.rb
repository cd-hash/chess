module Stepable
    def knight_moves
        return KNIGHT_MOVES
    end

    def king_moves
        return KING_MOVES
    end

    def moves
        possible_moves = []
        move_diffs.each do |move|
            dx, dy = move
            new_move = [position[0] + dy, position[1] + dx]
            if @board.valid_pos?(new_move)
                if @board[new_move].class == NullPiece || @board[new_move].color != self.color
                    possible_moves << new_move
                end
            end
        end
        return possible_moves
    end

    private
    KNIGHT_MOVES = [[2,1], [2,-1], [1,2], [1,-2], [-2,1], [-2,-1], [-1,-2], [-1,2]]
    KING_MOVES = [[1,1], [1,0], [1,-1], [0,-1], [0,1], [-1,-1], [-1,0], [-1,1]]
end