class State
	include Rubygame::EventHandler::HasEventHandler

	def initialize(screen, content)
		@screen = screen
		@graphics = content
	end

	def update()
		# Fetch the user input events from SDL.
		events = Rubygame::Events.fetch_sdl_events
	 
		# Pass each input to the event handler to check.
		events.each do |event|
			self.handle( event )
		end
	end

	def draw()
	end

end
