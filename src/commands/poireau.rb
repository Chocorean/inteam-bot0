# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Goes into main vocal channel and shouts a random song.
    module Poireau
      extend Discordrb::Commands::CommandContainer
      command(:poireau, in: '#botland') do |event|
        # Joining user channel
        channel = event.user.voice_channel
        next CONFIG.i18n['poireau_no_channel'] unless channel
        BOT.voice_connect(channel)
        # Forging Youtube URL search
        webpage = `curl https://www.palabrasaleatorias.com/mots-aleatoires.php`
        puts webpage
        #url = "https://www.youtube.com/results?search_query=#{}"
        #voice()
      end
    end
  end
end
