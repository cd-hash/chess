require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
    include Slideable

    def symbol
        return "\u2657"
    end

    def move_dirs
        return diagonal_dirs
    end
end