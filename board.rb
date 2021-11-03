require_relative 'all_pieces'

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }
        setup_board
    end

    def setup_board
        starting_rows = [0, 1, 6, 7]
        @board.each_with_index do |row, row_index|
            if starting_rows.include?(row_index)
                row.each_index { |tile_index| row[tile_index] = Piece.new([row_index, tile_index], self.board) }
            end
        end
    end

    def [](pos_array)
        row, col = pos_array
        @board[row][col]
    end

    def []=(pos_array, val)
        row, col = pos_array
        @board[row][col] = val
    end

    def valid_pos?(pos)
        pos.all? {|coord| coord.between?(0, 7) }
    end

    def move_piece(start_pos, end_pos)
        raise 'no piece is here' if self[start_pos].nil?
        
        # raise error if piece cannot move to end position
        piece = self[start_pos]
        potential_moves = piece.moves
        raise 'you cannot move here' if !potential_moves.include?(end_pos)
        self[start_pos] = nil
        self[end_pos] = piece
    end
end

if __FILE__ == $PROGRAM_NAME
    b = Board.new
    p = Pawn.new([2,0], b)
    p p.moves
end