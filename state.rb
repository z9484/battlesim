class State
	include Rubygame::EventHandler::HasEventHandler

	def initialize(screen, content)
		@screen = screen
		@graphics = content
		make_queue
	end

	def update(clock)
		# Fetch the user input events from SDL.
		#events = Rubygame::Events.fetch_sdl_events
	 
		# Pass each input to the event handler to check.
		#events.each do |event|
		#	self.handle( event )
		#end

 		@queue.fetch_sdl_events
    @queue << clock.tick
    @queue.each do |event|
      self.handle( event )
    end


	end

	def draw()
	end

  def make_queue
    @queue = EventQueue.new()
    @queue.enable_new_style_events
    @queue.ignore = [MouseMoved]
  end

end
