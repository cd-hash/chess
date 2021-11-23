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
        system("clear") #clear the console anytime render is called
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
end

