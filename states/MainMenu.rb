require 'character.rb'

class MainMenu < State
	def initialize(screen, content)
		super(screen, content)

		@player1 = Character.new()

		@map = loadMap("maps/t1.map") 
		make_magic_hooks( :q            => :exit_script,
                      :escape       => :exit_script,
                      :mouse_right  => :exit_script,
                      :left         => :player_left,
                      :right        => :player_right,
                      :up           => :player_up,
                      :down         => :player_down,
                      QuitRequested => :exit_script )
	end

	def draw()
    #@screen.update

    for y in 0..5
      for x in 0..4
        @graphics[@map[y][x]].blit(@screen, [y*TILESIZE,x*TILESIZE])
      end
    end

    @graphics["@"].blit( @screen, [@player1.posX*TILESIZE, @player1.posY*TILESIZE] )
		@screen.update
	end

	def exit_script()
		exit
	end

	def player_left
		@player1.moveLeft()
	end 

	def player_right
		@player1.moveRight()
	end
	 
	def player_up
		@player1.moveUp()
	end

	def player_down
		@player1.moveDown()
	end

end
