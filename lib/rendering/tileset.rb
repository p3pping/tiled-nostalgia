class Tileset
  attr_reader :tile_width, :tile_height, :image
  def initialize(tile_width, tile_height, tiles)
    @tile_width = tile_width
    @tile_height = tile_height
    @image = image
    @tiles = tiles
  end

  def draw(tile_id, x_position, y_position, layer: 0)
    @tiles[tile_id].draw(x_position, y_position, layer)
  end

  def count
    @tiles.count
  end
end
