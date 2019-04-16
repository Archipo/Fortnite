class Player
    attr_accessor :name, :life_points  #attribut nom et point de vie joueur

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state #etat des joueurs
        return "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_received) #faire baisser le niveau de vie
        @life_points -= damage_received #soustrait dégâts reçus des points de vie
        if @life_points <= 0
            puts "Le joueur #{@name} a été tué !"
        end
    end

    def attacks(player) #attaquer un joueur
        puts "#{@name} attaque #{player.name}"
        damage_deal = compute_damage #faire appel à la méthode compute_damage définie ci-dessous
        puts "il lui inflige #{damage_deal} points de dommages"
        player.gets_damage(damage_deal) #faire subir les dégâts à l'autre joeuur
    end

    def compute_damage #dégâts aléatoires
        return rand(1..6)
      end
end

class HumanPlayer < Player #hérite des attributs de Player
    attr_accessor :weapon_level
    
    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    def show_state #cf show_state ci-dessus
        return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage #dégâts aléatoires multipliés par niveau de l'arme
        rand(1..6) * @weapon_level
      end

    def search_weapon #cherche une arme
        weapon_found_lvl = rand(1..6)  #niveau de l'arme trouvée
        puts "Tu as trouvé une arme de niveau #{weapon_found_lvl}"
        if weapon_found_lvl > @weapon_level #garde la meilleure arme
            @weapon_level = weapon_found_lvl
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        elsif weapon_found_lvl <= @weapon_level
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack #cherche une pack de soin
        result = rand(1..6)
        if result == 1 #récompense en fonction du résultat aléatoire
            puts "Tu n'as rien trouvé ..."
        elsif result >= 2 && result <= 5
            if @life_points >= 50 #si au dessus de 50 forcément = à 100
                @life_points = 100
                puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            else
                @life_points += 50
                puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            end
        elsif result == 6
            if @life_points >= 20
                @life_points = 100
                puts "Waow, tu as trouvé un pack de +80 points de vie !"
            else
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            end
        end
    end
end