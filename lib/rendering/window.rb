require 'gosu'

class Window < Gosu::Window
  attr_writer *%i[update draw on_input_pressed on_input_released on_close context]

  def initialize(context, **options)
    super(context.width, context.height, options)
    self.caption = options[:caption] if options.key?(:caption)

    raise ArgumentError, "Context cannot be nil." unless context
    @context = context
  end

  def set_camera(camera)
    @camera = camera
  end

  private

  def update
    delta = delta_time
    update_timestamp

    super
    @update.call(delta) if @update
  end

  def draw
    super
    if @camera.nil?
      Gosu.scale(@context.scale_x, @context.scale_y) do
        @draw.call if @draw
      end
    else
      @camera.render(@context) do
        Gosu.scale(@context.scale_x, @context.scale_y) do
          @draw.call if @draw
        end
      end
    end
  end

  def button_up(id)
    super
    @on_input_released.call(id) if @on_input_released
  end

  def button_down(id)
    super
    @on_input_pressed.call(id) if @on_input_pressed
  end

  def close
    super
    @on_close.call if @on_close
  end

  def get_timestamp
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def delta_time
    @timestamp || update_timestamp
    get_timestamp - @timestamp
  end

  def update_timestamp
    @timestamp = get_timestamp
  end
end
