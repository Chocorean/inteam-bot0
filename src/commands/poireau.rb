# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

def get_word
  data = Nokogiri::HTML.parse(open('https://www.palabrasaleatorias.com/mots-aleatoires.php'))
  data.search('//tr//td//div').inner_text[2..-1]
end


module Bot
  module DiscordCommands
    # Goes into main vocal channel and shouts a random song.
    module Poireau
      extend Discordrb::Commands::CommandContainer
      command(:poireau, in: '#botland') do |event|
        # Joining user channel
        channel = event.user.voice_channel
        next CONFIG.i18n['poireau_no_channel'] unless channel
        # Getting random French word
	data = Nokogiri::HTML.parse(open('https://www.palabrasaleatorias.com/mots-aleatoires.php'))
        random_word = data.search('//tr//td//div').inner_text[2..-1]
	# Forging Youtube search request
	# TODO
	return nil
	# Joining voice channel and shouting
        # TODO
	# BOT.voice_connect(channel)
	# BOT.voice()
	# etc
      end
    end
  end
end
