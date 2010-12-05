import random

class Point(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y

def generatemap():
    numX = 20
    numY = 50

    #init map 
    map1 = []
    for row in xrange(numY):    
        y = []
        for elem in xrange(numX):
            y.append("_")
        map1.append(y)


    #add borders
    for i in xrange(numX):
        map1[0][i] = "#"
        map1[numY-1][i] = "#"

    for i in xrange(numY):
        map1[i][0] = "#"
        map1[i][numX-1] = "#"


    #add cap
    
    row = random.randint(5,numY-7)
    col = random.randint(5,numX-7)
    capital = Point(col, row)
    
    #[row][col]
    map1[capital.y][capital.x] = "d"
 
    for row in map1:    
        print row

if __name__ == "__main__":
    generatemap()
