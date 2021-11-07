require 'byebug'
require_relative 'piece'

class Pawn < Piece

    def symbol
        return "\u2659"
    end

    def moves
        possible_moves = []
        possible_moves << [position[0] + (forward_steps * forward_dir), 0] if @board.valid_pos?([position[0] + (forward_steps * forward_dir), 0])
        possible_moves += side_attacks
        return possible_moves
    end

    def at_start_row?
        return position[0] == 1 || position[0] == 6
    end

    def forward_dir
        #returns 1 or -1
        return color == "white" ? -1 : 1
    end

    def forward_steps
         return at_start_row? == true ? 2 : 1
    end

    def side_attacks
        possible_attacks = []
        attacks = [[(1*forward_dir), 1], [(1*forward_dir), -1]]
        attacks.each do |attack|
            dy, dx = attack
            # debugger
            if @board[[position[0] + dy, position[1] + dx]].class != NullPiece && @board.valid_pos?([position[0] + dy, position[1] + dx]) && @board[[position[0] + dy, position[1] + dx]].color != self.color
                possible_attacks << [position[0] + dy, position[1] + dx]
            end
        end

        return possible_attacks
    end
end