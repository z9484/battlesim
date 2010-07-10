require 'character.rb'
COOLTIME = 0.05

class MainMenu < State
	def initialize(screen, content)
		super(screen, content)

		@player1 = Character.new()
		@cooldown = COOLTIME
		@map = loadMap("maps/t1.map")

		make_magic_hooks(
											KeyPressed => :key_pressed,
											KeyReleased => :key_released,
											ClockTicked => :update_clock,
                      QuitRequested => :exit_script )
	end

	def key_pressed(event)
		if event.key == :left
			player_left
		elsif event.key == :right
			player_right
		elsif event.key == :up
			player_up
		elsif event.key == :down
			player_down
		elsif event.key == :q or event.key == :escape
			exit_script()
		end
	end

	def key_released(event)
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
		#@last_update_time = event.seconds
		@cooldown -= event.seconds
	end

	def check_cool
		puts @cooldown
		if @cooldown <= 0
			@cooldown = COOLTIME
			return true
		else
			return false
		end
	end

end
