# frozen_string_literal: true

require 'json'

module Bot
  # Initialize a new config.
  class Config
    # Load the config.
    def initialize
      config = JSON.parse(File.read('data/config.json'))
      config.keys.each do |key|
        self.class.send(:define_method, key) do
          config[key]
        end
      end
    end
  end
end
