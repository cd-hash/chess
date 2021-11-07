require 'byebug'
module Slideable
    def horizontal_dirs
        return HORIZONTAL_DIRS
    end

    def diagonal_dirs
        return DIAGONAL_DIRS
    end

    def moves # returns all possible moves
        possible_moves = []
        move_dirs.each do |move|
            dy, dx = move
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        return possible_moves
    end

    def move_dirs
    end

    private
    def grow_unblocked_moves_in_dir(dx, dy)
        new_move = [position[0] + dy, position[1] + dx]
        valid_moves = []
        # debugger
        while @board.valid_pos?(new_move)
            if self.board[new_move].class == NullPiece
                valid_moves << new_move.clone
            elsif self.board[new_move].color != self.color
                valid_moves << new_move.clone
            else
                break
            end
            new_move[0] += dy
            new_move[1] += dx
        end
        return valid_moves
    end

    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,1], [1,-1]]
end