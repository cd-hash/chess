require_relative 'board.rb'

class Piece
    attr_reader :position, :board, :color

    def initialize(position, board, color)# color is how we're going to track sides
        @position = position
        @board = board
        @color = color
    end

    def moves
        #this returns all viable moves for a piece
    end
end