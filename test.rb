#!/usr/bin/env ruby
# 
# A basic image viewer demo for Rubygame.
# 
# Author:   John Croisant
# Date:     2009-10-18
# License:  You may use this code however you want. No warranty.
# 
 
# Load Rubygame and include Rubygame and Rubygame::Events
# in the current namespace, for convenience.
# 
require "rubygems"
require "rubygame"
require 'loadmap.rb'
require 'character.rb'

include Rubygame
include Rubygame::Events
include Load
include CharMod

 
TILESIZE = 32

class MyHandler
  include Rubygame::EventHandler::HasEventHandler

	def exit_script
		exit
	end

end

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
      @map = loadMap("maps/t1.map")
      @screen = Rubygame::Screen.set_mode [320,240] 
      @screen.title = 'Battle Sim'
      @screen.fill [0,0,255]
      @screen.update
     
    rescue SDLError, NoMethodError
      exit
      puts "Failed to load data"
    end

		@handler = MyHandler.new
		@handler.make_magic_hooks( :q            => :exit_script,
				                      :escape       => :exit_script,
				                      :mouse_right  => :exit_script,
				                      :left         => :player_left,
				                      :right        => :player_right,
				                      :up           => :player_up,
				                      :down         => :player_down,
				                      QuitRequested => :exit_script )
 

  end

  def Update()
  end

  ## Draw ##
  def Draw()
    #@screen.update

    for y in 0..5
      for x in 0..4
        @tiles[@map[y][x]].blit(@screen, [y*TILESIZE,x*TILESIZE])
      end
    end

    @tiles["@"].blit( @screen, [2*TILESIZE,2*TILESIZE] )
  end

	def run()
		loop do
		 
			# Fetch the user input events from SDL.
			events = Rubygame::Events.fetch_sdl_events
		 
			# Pass each input to the event handler to check.
			events.each do |event|
				@handler.handle( event )
			end
		 
			#game.Update()
			# Refresh the screen
			Draw()
			@screen.update
		 
			# Pause for a while before checking for more events.
			sleep 0.1
		 
		end

	end
end
 

 
def player_left
  exit
end 

def player_right
  exit
end
 
def player_up
  exit
end

def player_down
  exit
end

game = Game.new()
player1 = Character.new()
game.run()
#LoadContent()


