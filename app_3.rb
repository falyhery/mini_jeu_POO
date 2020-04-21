require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#------------------------------------------------
#Bienvenue sur 'POO POO POO POO POOOOOO' !      |
#Last player standing takes it all ! Good luck !|
#------------------------------------------------

#Initialisation du joueur
def ask_player_name
	puts "Quel est ton prénom ?"
	print "> "
	first_name = gets.chomp
end

#Initialisation du jeu
my_game = Game.new(ask_player_name)

#Bataille royale
while my_game.is_still_ongoing? 
	my_game.show_players
	my_game.menu
	my_game.menu_choice(player_choice)
	my_game.enemies_attack
end

#Fin du jeu
my_game.end_of_game