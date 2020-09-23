module Rendering
  class Context
    attr_reader *%i[width height scale_x scale_y]
    def initialize(width, height, scale_x=0, scale_y=scale_x)
      @width = width
      @height = height
      @scale_x = scale_x
      @scale_y = scale_y
    end
  end
end
