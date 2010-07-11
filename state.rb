class State
	include Rubygame::EventHandler::HasEventHandler

	def initialize(screen, content)
		@screen = screen
		@graphics = content
		make_queue
		@keys = []
		#@pkeys = []

		make_magic_hooks(
											KeyPressed => :key_pressed,
											KeyReleased => :key_released,
											ClockTicked => :update_clock,
                      QuitRequested => :exit_script )
 
	end

	def update(clock)
		#@pkeys = @keys
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

  # Add it to the list of keys being pressed.
  def key_pressed( event )
    @keys += [event.key]
  end
 
 
  # Remove it from the list of keys being pressed.
  def key_released( event )
    @keys -= [event.key]
  end

	

end
