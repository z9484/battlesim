require 'character.rb'
COOLTIME = 0.1

class MainMenu < State
	def initialize(screen, content)
		super(screen, content)

		@player1 = Character.new()
		@cooldown = COOLTIME
		@last_update_time  = 0
		@map = loadMap("maps/t1.map")


	end

	def draw()

    for y in 0..5
      for x in 0..4
        @graphics[@map[y][x]].blit(@screen, [y*TILESIZE,x*TILESIZE])
      end
    end

    @graphics["@"].blit( @screen, [@player1.posX*TILESIZE, @player1.posY*TILESIZE] )
	end

	def exit_script()
		exit
	end

	def player_left
		if @map[@player1.posX - 1][@player1.posY] != "#"
			@player1.moveLeft()
		end
	end 

	def player_right
		if @map[@player1.posX + 1][@player1.posY] != "#"
			@player1.moveRight()
		end
	end
	 
	def player_up
		if @map[@player1.posX][@player1.posY - 1] != "#"
			@player1.moveUp()
		end
	end

	def player_down
		if @map[@player1.posX][@player1.posY + 1] != "#"
			@player1.moveDown()
		end
	end

	def update_clock(event)
		@last_update_time = event.seconds
		#@cooldown -= event.seconds

 		@keys.each do |key|
			input(key) if check_cool
    end
		
	end


	def check_cool
		
		if @cooldown <= 0
			@cooldown = COOLTIME
			return true
		else
			@cooldown -= @last_update_time
			return false
		end
	end

	#def key_released( event )
		#super(event)
		#input(event.key)
	#end

	def input(key)
    if key == :left
			player_left
		elsif key == :right
			player_right
		elsif key == :up
			player_up
		elsif key == :down
			player_down
		elsif key == :q or key == :escape
			exit_script
		end
	end

end
