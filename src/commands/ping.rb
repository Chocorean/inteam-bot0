# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Goes into main vocal channel and shouts a random song.
    module Ping
      extend Discordrb::Commands::CommandContainer
      command(:ping, in: '#botland') do
        CONFIG.i18n['ping_output']
      end
    end
  end
end
