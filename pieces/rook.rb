require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable

    def symbol
        return "\u2656"
    end

    def move_dirs
        return horizontal_dirs
    end
end