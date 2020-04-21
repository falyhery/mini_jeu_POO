class Game
	attr_accessor :human_player, :enemies

	def initialize(first_name)
		@enemies = [player1, player2, player3, player4]
		@human_player = first_name
		player1 = Player.new("Josiane")
		player2 = Player.new("José")
		player3 = Player.new("Jocelyne")
		player4 = Player.new("Jonathan")
	end

	def kill_player(player)
		@enemies.delete(player)
	end

	def is_still_ongoing? 
		if @human_player.life_points > 0 && @enemies.any? = true 
			return true
		else
			return false 
		end
	end

	def show_players
		puts "Voici l'état de ton joueur: "
			human_player.show_state
		puts "Le nombre de joueurs bots restants est de #{@enemies.size}"
	end

	def menu
		puts "Quelle action veux-tu effectuer ?"
		puts "\n"
		puts "   a - chercher une meilleure arme "
		puts "   s - chercher à se soigner"
		puts "\n"
		puts "   attaquer un joueur en vue :"
		puts "   0 - tu choisis d'attaquer le robot Josiane"
		puts "   1 - tu choisis d'attaquer le robot José"
		puts "   2 - tu choisis d'attaquer le robot Jocelyne"
		puts "   3 - tu choisis d'attaquer le robot Jonathan"
		puts "---"*10
		print "> "
		return player_choice = gets.chomp
	end

	def menu_choice(player_choice)
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
	end

#Riposte des robots ennemis
	def enemies_attack
		puts "Tous les ennemis ripostent"
		enemies.each do |enemy|
			if enemy.life_points > 0
			break if human_player.life_points <= 0 
			enemy.attacks(human_player)
			end
		end
	end

#Fin du jeu 
	def end
		puts "\n"
		puts "La partie est finie"
		if human_player.life_points > 0 
			puts "BRAVO ! TU ES LE DERNIER DEBOUT !"
		else puts "C'est trop la lose. Mais tu peux toujours recommencer..."
		end
	end

end