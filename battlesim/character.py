TILESIZE = 32
class Character(object):
    def __init__(self):
	    self.posX = 1 * TILESIZE
	    self.posY = 1 * TILESIZE

    def moveLeft(self):
	    self.posX -= 8

    def moveRight(self):
	    self.posX += 8

    def moveUp(self):
	    self.posY -= 8

    def moveDown(self):
	    self.posY += 8

    def snap(self):
        print self.posX, self.posY
        self.posX = (self.posX / TILESIZE + 1) * TILESIZE

        #self.posX = (self.posX / TILESIZE + 1) * TILESIZE
        #self.posY = (self.posY / TILESIZE) * TILESIZE
