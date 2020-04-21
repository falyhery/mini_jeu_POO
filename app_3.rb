require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#------------------------------------------------
#Bienvenue sur 'POO POO POO POO POOOOOO' !      |
#Last player standing takes it all ! Good luck !|
#------------------------------------------------

#Initialisation du joueur
puts "Quel est ton prénom ?"
print "> "
first_name = gets.chomp
my_game = Game.new(first_name)

#Initialisation du jeu
my_game.initialize

while my_game.is_still_ongoing? 
	my_game.show_players
	my_game.menu
	my_game.menu_choice(player_choice)
	my_game.enemies_attack
end

my_game.end