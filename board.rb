require_relative 'all_pieces'
require 'byebug'

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) { NullPiece.instance} }
        setup_board
    end

    def setup_board
        major_pieces_rows = [0, 7]
        pawn_row = [1, 6]
        @board.each_with_index do |row, row_index|
            color = row_index > 1 ? :white : :black
            if major_pieces_rows.include?(row_index) # place rook, knight, bishop, queen, king
                row.each_index do |tile_index|
                    if tile_index == 0 || tile_index == 7
                        row[tile_index] = Rook.new([row_index, tile_index], self, color)
                    elsif tile_index == 1 || tile_index == 6
                        row[tile_index] = Knight.new([row_index, tile_index], self, color)
                    elsif tile_index == 2 || tile_index == 5
                        row[tile_index] = Bishop.new([row_index, tile_index], self, color)
                    elsif tile_index == 3
                        row[tile_index] = Queen.new([row_index, tile_index], self, color)
                    else
                        row[tile_index] = King.new([row_index, tile_index], self, color)
                    end
                end
            elsif pawn_row.include?(row_index)
                row.each_index { |tile_index| row[tile_index] = Pawn.new([row_index, tile_index], self, color)}
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

    def find_king(color)
        @board.each_with_index do |row, i|
            row.each_with_index do |tile, j|
                return [i,j] if tile.class == King && tile.color == color
            end
        end
    end

    def in_check?(color)
        opposing_color = color == :white ? :black : :white
        king_pos = find_king(color)

        pieces(opposing_color).each do |piece|
            # next if piece.class == NullPiece
            # debugger
            return true if piece.moves.any? {|move| move == king_pos}
        end
        return false
    end

    def checkmate?(color)
        return false unless in_check?(color)

        pieces(color).none? do |piece|
            # is there any move that can make #in_check? false again
            # debugger
            piece.valid_moves.any?
        end
    end

    def move_piece(turn_color, start_pos, end_pos)
        raise 'no piece is here' if self[start_pos].class == NullPiece
        piece = self[start_pos]
        # raise error if piece cannot move to end position
        raise 'you must move your own pieces' if turn_color != piece.color
        potential_moves = piece.moves
        raise 'you cannot move here' if !potential_moves.include?(end_pos)
        raise 'you cannot move into or leave yourself in check!' if !piece.valid_moves.include?(end_pos)
        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        self[end_pos] = piece
        self[end_pos].update_postion(end_pos)
        self[start_pos] = NullPiece.instance
    end

    def dup
        duped_board = Board.new
        (0..7).each do |i|
            (0..7).each do |j|
                duped_board[[i, j]] = NullPiece.instance if self[[i, j]].instance_of?(NullPiece)
                piece = self[[i, j]]
                duped_board[[i, j]] = duped_board.add_piece(piece.position, piece.color, piece.class.to_s.to_sym)
            end
        end
        return duped_board
    end

    
    def add_piece(pos, color, piece_type)
        case piece_type
        when :Rook
            Rook.new(pos, self, color)
        when :Bishop
            Bishop.new(pos, self, color)
        when :Knight
            Knight.new(pos, self, color)
        when :Queen
            Queen.new(pos, self, color)
        when :King
            King.new(pos, self, color)
        when :Pawn
            Pawn.new(pos, self, color)
        when :NullPiece
            NullPiece.instance
        end
    end

    private
    def pieces(color)
        all_pieces = []
        @board.each_with_index do |row, i|
            row.each_index do |j|
                all_pieces << self[[i, j]] if self[[i, j]].color == color && self[[i, j]].class != NullPiece
            end
        end
        return all_pieces
    end
end