require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points && player2.life_points > 0 
    puts "\nVoici l'état de chaque joueur :"
    puts "#{player1.show_state}" #rappel état joueur
    puts "#{player2.show_state}" #rappel état joueur
    puts "\nPassons à la phase d'attaque :"
    player1.attacks(player2) #attaque joueur 2 par joueur 1
    if player2.life_points <= 0 #sauf si déjà mort
        break
    end
    player2.attacks(player1)
    if player1.life_points <= 0 
        break
    end
end