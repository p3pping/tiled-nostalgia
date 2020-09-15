require_relative '../rendering/window.rb'

module Factories
  class Window
    def self.create(width, height, caption: '')
      ::Window.new(width,height,caption: caption)
    end
  end
end
