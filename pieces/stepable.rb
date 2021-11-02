module Stepable
    def knight_moves
        return KNIGHT_MOVES
    end

    def king_moves
        return KING_MOVES
    end

    def moves
    end

    private
    KNIGHT_MOVES = [[2,1], [2,-1], [1,2], [1,-2], [-2,1], [-2,-1], [-1,-2], [-1,2]]
    KING_MOVES = [[1,1], [1,0], [1,-1], [0,-1], [0,1], [-1,-1], [-1,0], [-1,1]]
end