require 'bundler'
Bundler.require

require_relative 'lib/player'

puts "------------------------------------------------ 
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------\n" #intro de bienvenue

puts "Quel est ton prénom ?"
name_user = gets.chomp #demande prénom
user = HumanPlayer.new("#{name_user}") #incorpore prénom
player1 = Player.new("Josiane") #création bot
player2 = Player.new("José") #création bot
enemies = [player1, player2] 

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts "\nVoici l'état de santé de votre joueur :"
    puts "#{user.show_state}" #rappel état santé
    puts "\nQuelle action veux-tu effectuer ?" #possibilité d'action
    puts "\na - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\n attaquer un joueur en vue :"
    puts "0 - #{player1.show_state}" #rappel état santé des bots
    puts "1 - #{player2.show_state}" #rappel état santé des bots
    user_choice = gets.chomp #demande action choisie et réalise action en fonction du choix
    if user_choice == "a"
        user.search_weapon
    elsif user_choice == "s"
        user.search_health_pack
    elsif user_choice == "0"
        user.attacks(player1)
    elsif user_choice == "1"
        user.attacks(player2)
    else
        puts "\nVeuillez choisir une des possibilités indiquées !"
    end
    puts "---------------------------------------------------" #histoire d'aérer dans le terminal 
    puts "\nLes autres joueurs t'attaquent !" #attaque des autres joueurs
    enemies.each do |enemie| #s'ils sont en vie
        if enemie.life_points <= 0
            break
        else 
            enemie.attacks(user)
        end
    end
end

puts "La partie est finie"
if user.life_points > 0 
    puts "BRAVO ! TU AS GAGNE !"
else 
    puts "Loser ! Tu as perdu !"
end
