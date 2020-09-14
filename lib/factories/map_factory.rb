require_relative '../game_objects/map.rb'
require_relative '../utilities/file_parsers/csv_map_parser.rb'

class MapFactory
  def self.load(file_path, tileset, parser: CsvMapParser.new)
    data = parse_file(file_path, parser)

    Map.new(data[:width], data[:height], tileset).tap do |map|
      data[:height].times do |y|
        data[:width].times do |x|
          map.set_tile(x, y, data[:tiles][y*data[:width] + x].to_i)
        end
      end
    end
  end

  private

  def self.parse_file(file_path, parser)
    contents = ''
    File.open(file_path, 'r').tap do |file|
      contents = file.read
    end.close
    parser.parse(contents)
  end
end

