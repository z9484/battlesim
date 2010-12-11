import pygame, math, sys
from pygame.locals import *

from character import *
from loadmap import *

FRAMES_PER_SECOND = 30
BLACK = (0,0,0)
TILESIZE = 32

class Game(object):
    def __init__(self):
        self.screen = pygame.display.set_mode((640, 480))
        pygame.display.set_caption("BattleSim")
        self.clock = pygame.time.Clock()

        ## Load Content ##
        self.player = pygame.image.load('../gfx/ninja.png')
        self.ground = pygame.image.load('../gfx/ground.bmp')
        self.wall = pygame.image.load('../gfx/wall.bmp')

        self.tiles = {}
        self.tiles["@"] = self.player
        self.tiles["_"] = self.ground
        self.tiles["#"] = self.wall

    def update(self):
        # USER INPUT
        self.clock.tick(FRAMES_PER_SECOND)
        for event in pygame.event.get():
            if event.type == QUIT: sys.exit(0)    
            if hasattr(event, 'key'):
                #down = event.type == KEYDOWN     # key down or up?
                if event.key == K_ESCAPE or event.key == K_q: sys.exit(0)     

        
    def draw(self):
        self.screen.fill(BLACK)
        self.screen.blit(self.player, (50, 100))
        pygame.display.flip()

    def run(self):

        while 1:
            self.update()
            self.draw()


game = Game()
game.run()
