require_relative '../rendering/window.rb'

module Factories
  class Window
    def self.create(caption, context)
      ::Window.new(context, caption: caption)
    end
  end
end
