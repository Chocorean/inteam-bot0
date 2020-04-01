#!/usr/bin/env ruby2.5

# frozen_string_literal: true

require 'discordrb'

# The main bot module.
module Bot
  # Load non-Discordrb modules
  Dir['src/modules/*.rb'].each { |mod| load mod }

  # Bot configuration
  CONFIG = Config.new

  # Create the bot.
  BOT = Discordrb::Commands::CommandBot.new(
    token: CONFIG.bot['token'],
    prefix: CONFIG.bot['prefix'],
    channels: CONFIG.bot['channels'],
    ignore_bots: CONFIG.bot['ignore_bots'],
    command_doesnt_exist_message: CONFIG.i18n['command_doesnt_exist']
  )

  # Discord commands
  module DiscordCommands; end
  Dir['src/commands/*.rb'].each { |mod| load mod }
  DiscordCommands.constants.each do |mod|
    #puts "Adding #{mod} command"
    BOT.include! DiscordCommands.const_get(mod)
  end

  BOT.run
end
