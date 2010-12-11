from character import *
from state import *
from loadmap import *
import pygame, sys
from pygame.locals import *

COOLTIME = 0.1
BLACK = (0,0,0)
TILESIZE = 32

class GameState(State):
    def __init__(self, screen, content):
        super(GameState, self).__init__(screen, content)

        self.player1 = Character()
        self.cooldown = COOLTIME
        self.dt  = 0
        self.map = loadMap("maps/t1.map")

    def draw(self):
        self.screen.fill(BLACK)
        for y in xrange(6):
            for x in xrange(5):
                self.screen.blit(self.content[self.map[y][x]], (y*TILESIZE, x*TILESIZE) )

        self.screen.blit(self.content["@"], (self.player1.posX, self.player1.posY) )

    def player_left(self):
        #if self.map[self.player1.posX - 1][self.player1.posY] != "#":
        self.player1.moveLeft()

    def player_right(self):
	    #if self.map[self.player1.posX + 1][self.player1.posY] != "#":
	    self.player1.moveRight()
     
    def player_up(self):
	    #if self.map[self.player1.posX][self.player1.posY - 1] != "#":
	    self.player1.moveUp()

    def player_down(self):
	    #if self.map[self.player1.posX][self.player1.posY + 1] != "#":
	    self.player1.moveDown()

    def check_cool(self):
        if self.cooldown <= 0:
	        self.cooldown = COOLTIME
	        return True
        else:
	        self.cooldown -= self.dt
	        return False

    def keyreleased(self, key):
        #self.player1.snap()
        super(GameState, self).keyreleased(key) 

        

    def update(self, clock):
        super(GameState, self).update(clock) 
            #if event.type == QUIT: sys.exit(0)    
            #if hasattr(event, 'key'):
                #down = event.type == KEYDOWN     # key down or up?
               # if event.type == KEYDOWN:
        for key in self.keys:
            if key == K_ESCAPE or key == K_q: sys.exit(0)
            elif key == K_LEFT: self.player_left()
            elif key == K_RIGHT: self.player_right()
            elif key == K_UP: self.player_up()
            elif key == K_DOWN: self.player_down()

