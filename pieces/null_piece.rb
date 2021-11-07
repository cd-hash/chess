require 'singleton'
require_relative 'piece'

class NullPiece < Piece
    include Singleton

    def symbol
        return ' '
    end

    def initialize
    end
end