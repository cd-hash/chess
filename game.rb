require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {:white => Player.new(:white, @display), :black => Player.new(:black, @display)}
        @current_player = :white
    end

    def play
        until @board.checkmate?(@current_player)
            begin
            start_pos, end_pos = @players[@current_player].make_move
            @board.move_piece(@current_player, start_pos, end_pos)
            rescue StandardError => e
                puts "#{e.message} Try Again"
                sleep 2
                retry
            end
            swap_players
        end
        @display.render
        puts "Congratulations #{opposite_player}!! \nYou Won!!"
    end

    private
    def notify_players
    end

    def opposite_player
        winner = @current_player == :white ? :black : :white
    end

    def swap_players
        @current_player = @current_player == :white ? :black : :white
    end
end

if __FILE__ == $PROGRAM_NAME
    game = Game.new
    game.play
end