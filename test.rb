#!/usr/bin/env ruby
# 
# A basic image viewer demo for Rubygame.
# 
# Usage:    Pass an image file to this script to display it. To quit,
#           press Q or Escape, right click, or close the window.
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
include Load
include Rubygame
include Rubygame::Events
 
TILESIZE = 32

# Initialize Rubygame, and clean up when script exits.
Rubygame.init
at_exit { Rubygame.quit }
 
 
# Decide which image file to load.
this_dir = File.dirname( __FILE__ )
file = File.expand_path( "gfx/ninja.png", this_dir ) # default file
groundfile = File.expand_path( "gfx/ground.bmp", this_dir )
wallfile = File.expand_path( "gfx/wall.bmp", this_dir )
#if ARGV[0]
#  file = File.expand_path( ARGV[0], this_dir )
#else
#  puts "You can pass an image to this script to load it."
#end
 

# Wrap this code in a "begin/rescue" block to recover from errors if
# the image cannot be loaded.
# 
begin
 
  
  # Load the image
  image = Surface.load( file )
  ground = Surface.load( groundfile )
  wall = Surface.load( wallfile )

  tiles = {}
  tiles["@"] = image
  tiles["_"] = ground
  tiles["#"] = wall
  map = loadMap("maps/t1.map") 

  # Open a new Rubygame window to fit the image.
  #screen = Screen.open( image.size )
  #screen.title = File.basename(file)
  screen = Rubygame::Screen.set_mode [320,240]
  screen.title = 'Battle Sim'
  screen.fill [0,0,255]
  screen.update

  # Blit ("paste") the image onto the screen.

  for y in 0..5
    for x in 0..4
      #puts map[y][x]
      #puts tiles[map[y][x]]
      tiles[map[y][x]].blit(screen, [y*TILESIZE,x*TILESIZE])
    end
  end

  image.blit( screen, [2*TILESIZE,2*TILESIZE] )
 
rescue SDLError, NoMethodError
 
  # Oops, load failed.
  puts "#{File.basename($0)}: Could not load image: #{file}"
 
  # Open a new Rubygame window
  screen = Screen.open( [200,200] )
  screen.title = "Load Error"
 
  # Fill with white
  screen.fill( :white )
 
  # Thick red line from top left to bottom right.
  # Point [0,0] is the top left corner of the screen,
  # [200,200] is bottom right.
  # 
  screen.draw_polygon_s( [[ -5,   5], [  5,  -5],
                          [205, 195], [195, 205]], :red )
 
  # Now from top right to bottom left.
  screen.draw_polygon_s( [[195,  -5], [205,   5],
                          [  5, 205], [ -5, 195]], :red )
 
end
 
 
# Set up an event handler to listen for events:
# 
#  - Q or Escape keys press
#  - Right mouse click inside the window
#  - Window close button press
# 
# When any of these events occurs, the "exit_script" method is called.
# 
class MyHandler
  include Rubygame::EventHandler::HasEventHandler
end
 
handler = MyHandler.new
handler.make_magic_hooks( :q            => :exit_script,
                          :escape       => :exit_script,
                          :mouse_right  => :exit_script,
                          :left         => :player_left,
                          :right        => :player_right,
                          :up           => :player_up,
                          :down         => :player_down,
                          QuitRequested => :exit_script )
 
def exit_script
  exit
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

# Repeat this code until the user quits.
loop do
 
  # Fetch the user input events from SDL.
  events = Rubygame::Events.fetch_sdl_events
 
  # Pass each input to the event handler to check.
  events.each do |event|
    handler.handle( event )
  end
 
  # Refresh the screen
  screen.update
 
  # Pause for a while before checking for more events.
  sleep 0.1
 
end
