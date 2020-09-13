class Map
  attr_reader :width, :height, :tileset

  def initialize(width, height, tileset)
    @width = width
    @height = height
    @tileset = tileset
    @tiles = (width*height).times.map { 0 }
  end

  def set_tile(x_position, y_position, tile_id)
    @tiles[(width*y_position) + (x_position % width)] = tile_id
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        @tiles[(y*width)+(x%width)].tap do |tile_id|
          @tileset.draw(
            tile_id,
            x* tileset.tile_width,
            y* tileset.tile_height
          )
        end
      end
    end
  end
end
