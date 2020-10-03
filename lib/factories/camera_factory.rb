require_relative '../rendering/camera.rb'

module Factories
  class Camera
    def self.create(position, rect)
      ::Camera.new(position, rect)
    end
  end
end