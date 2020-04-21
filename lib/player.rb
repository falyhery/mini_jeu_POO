class Player
	attr_accessor :name, :life_points

	def initialize(name_to_update)
		@name = name_to_update
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(damage_received)
		@life_points = @life_points - damage_received
		if @life_points <= 0 
			puts "le joueur #{@name} a été tué !"
		end
	end

	def attacks(attacked_player)
		player = attacked_player
		puts "#{@name} attaque #{player.name}"
		damage_amount = player.compute_damage
		puts "il lui inflige #{damage_amount} points de dommages"
		return player.gets_damage(damage_amount)
	end

	def compute_damage
		return rand(1..6) 
	end

end


class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name_to_update)
		@name = name_to_update
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		found_weapon_level = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{found_weapon_level}"
			if found_weapon_level > @weapon_level
				@weapon_level = found_weapon_level
				puts "Yes! une arme plus puissante!"
			else puts "arf, pas mieux"
			end
	end

	def search_health_pack
		search_result = rand(1..6)
			if search_result == 1
				puts "Désolé, tu n'as rien trouvé..."
			elsif search_result >= 2 && search_result <= 5
				@life_points = [@life_points + 50, 100].min
				puts "Cool, tu as trouvé un pack de +50 points de vie!"
			else 
				@life_points = [@life_points + 80, 100].min
				puts "La force est avec toi, tu as trouvé un pack de +80 points de vie!"
			end
	end

end