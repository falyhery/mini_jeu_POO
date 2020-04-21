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
human_player = HumanPlayer.new(first_name)

#Initialisation des ennemis 
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

#Le combat
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

	puts "Voici l'état de ton joueur: "
		human_player.show_state
	puts "\n"

#Menu
	puts "Quelle action veux-tu effectuer ?"
	puts "\n"
	puts "   a - chercher une meilleure arme "
	puts "   s - chercher à se soigner"
	puts "\n"
	puts "   attaquer un joueur en vue :"
	puts "   0 - tu choisis d'attaquer le robot Josiane"
	puts "   1 - tu choisis d'attaquer le robot José"
	puts "---"*10
	print "> "
	player_choice = gets.chomp

	if player_choice == "a"	#cherche une meilleure arme
		human_player.search_weapon 
	elsif player_choice == "s" #cherche à se soigner
		human_player.search_health_pack 
	elsif player_choice == "0" #lance une attaque sur le robot Josiane
		human_player.attacks(player1)
		player1.show_state
	elsif player_choice == "1" #lance une attaque sur le robot José
		human_player.attacks(player2)
		player2.show_state
	else 
		puts "Choisis parmi les options proposées"
	end

#Riposte des robots joueurs
puts "Les autres joueurs t'attaquent !"
enemies.each do |enemy|
	if enemy.life_points > 0
	break if human_player.life_points <= 0 
	enemy.attacks(human_player)
	end
end

end

#Fin du jeu 
puts "\n"
puts "La partie est finie"
	if human_player.life_points > 0 
		puts "BRAVO ! TU ES LE DERNIER DEBOUT !"
	else puts "C'est trop la lose. Mais tu peux toujours recommencer..."
	end

#binding.pry