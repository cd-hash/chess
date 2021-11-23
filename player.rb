

class Player
    attr_reader :color

    def initialize(color, display)
        @color = color
        @display = display
    end

    def make_move
        start_pos, end_pos = nil

        until start_pos && end_pos
            @display.render
            if start_pos
                puts "where would #{@color} like to place their piece"
                end_pos = @display.cursor.get_input
            else
                puts "#{@color} please select one of your pieces to move"
                start_pos = @display.cursor.get_input
                p start_pos
            end
        end
        return [start_pos, end_pos]
    end
end