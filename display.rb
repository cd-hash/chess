require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @board.board.each_with_index do |row, i|
            row.each_with_index do |tile, j|
                backgroud_color = (:yellow if [i, j] == @cursor.cursor_pos) || set_backgroud([i, j])
                if @cursor.selected && [i, j] == @cursor.cursor_pos
                    backgroud_color = :green
                end
                print " #{tile.to_s} ".colorize(:color => tile.color, :background => backgroud_color)
            end
            puts "\n"
        end
    end

    def set_backgroud(pos)
        row, col = pos
        return :light_blue if row % 2 == col % 2

        return :light_black
    end

    def test_me
        for i in 0...10
            render
            @cursor.get_input
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    b = Board.new
    game = Display.new(b)
    game.render
end