require_relative '../rendering/tileset.rb'
require 'gosu'

module Factories
  class Tileset
    def self.create(tile_width, tile_height, image_path)
      ::Tileset.new(
        tile_width,
        tile_height,
        Gosu::Image.load_tiles(image_path, tile_width, tile_height)
      )
    end
  end
end
