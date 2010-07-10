# Load Rubygame and include Rubygame and Rubygame::Events
# in the current namespace, for convenience.
# 
require "rubygems"
require "rubygame"
require 'loadmap.rb'
require 'character.rb'
require 'state.rb'
require 'states/MainMenu.rb'

include Rubygame
include Rubygame::Events
include Load

 
TILESIZE = 32

class Game 
	

  ## Load Content ##
  def initialize()
		Rubygame.init
		at_exit { Rubygame.quit }

    this_dir = File.dirname( File.expand_path(__FILE__) )
    Surface.autoload_dirs << File.join(this_dir, "gfx")

    player = Surface["ninja.png"]   
    ground = Surface["ground.bmp"]  
    wall = Surface["wall.bmp"] 
    @tiles = {}

		
    begin

      @tiles["@"] = player
      @tiles["_"] = ground
      @tiles["#"] = wall

      @screen = Rubygame::Screen.set_mode [320,240] 
      @screen.title = 'Battle Sim'
      @screen.fill [0,0,255]
      @screen.update
			@mainState = MainMenu.new(@screen, @tiles)
     
    rescue SDLError, NoMethodError
      exit
      puts "Failed to load data"
    end

  end

  def Update()
  end

  ## Draw ##
  def Draw()

  end

	def run()
		loop do
		 
			#game.Update()
			@mainState.update()
			
			# Refresh the screen
			@mainState.draw()
			#@screen.update
		 
			# Pause for a while before checking for more events.
			sleep 0.1
		 
		end
	end



end
 

 


game = Game.new()
player1 = Character.new()
game.run()
#LoadContent()


