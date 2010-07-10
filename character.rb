class Character
	def initialize()
		@posX = 1
		@posY = 1
	end
	
	def moveLeft()
		@posX -= 1
	end

	def moveRight()
		@posX += 1
	end

	def moveUp()
		@posY -= 1
	end

	def moveDown()
		@posY += 1
	end

	attr_reader :posX, :posY
end
