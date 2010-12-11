# INTIALISATION
import pygame, math, sys
from pygame.locals import *
screen = pygame.display.set_mode((640, 480))
ninja = pygame.image.load('../gfx/ninja.png')
clock = pygame.time.Clock()

FRAMES_PER_SECOND = 30
BLACK = (0,0,0)

while 1:

    # USER INPUT
    clock.tick(FRAMES_PER_SECOND)
    for event in pygame.event.get():
        if event.type == QUIT: sys.exit(0)    
        if not hasattr(event, 'key'): continue

        #down = event.type == KEYDOWN     # key down or up?
        if event.key == K_ESCAPE: sys.exit(0)     
    screen.fill(BLACK)

    # SIMULATION

    # RENDERING
    #rotated = pygame.transform.rotate(car, direction)
    #rect = rotated.get_rect()
    #rect.center = position
    
		# .. render the car to screen
    #screen.blit(rotated, rect)
    screen.blit(ninja, (50, 100))
    pygame.display.flip()

