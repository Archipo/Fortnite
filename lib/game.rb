class Game
    attr_accessor :human_player, :enemies

    def initialize (name)
        @human_player = name
        @enemies = [Player1, Player2, Player3, Player4]
    end

    def kill_player(player)
        @enemies -= player
    end

    def is_still_ongoing?
        if @human_player > 0 || @enemies != 0
            return true
        else
            return false
        end
    end

    def show_players
        @human_player.show_state
        @enemies.length
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts "\na - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "\n attaquer un joueur en vue :"
        puts "#{@enemies.index} - #{@enemies.show_state}"
        puts "#{@enemies.index} - #{@enemies.show_state}"
        puts "#{@enemies.index} - #{@enemies.show_state}"
        if @enemies.life_points <= 0
            break
        end
    end
end