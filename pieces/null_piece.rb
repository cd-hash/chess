require 'singleton'

class NullPiece < Piece
    include Singleton

    def symbol
        return ' '
    end

    def initialize
    end
end