require 'csv'

class CsvMapParser
  def parse(contents)
    width = nil
    height = 0
    tiles = []
    CSV.parse(contents) do |row|
      width ||= row.count
      raise "Map has varying widths, see row: #{height}" unless width == row.count

      tiles.push(*row)
      height += 1
    end

    format_data(width, height, tiles)
  end

  def format_data(width, height, tiles)
    {
      width: width,
      height: height,
      tiles: tiles
    }
  end
end
