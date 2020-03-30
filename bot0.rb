#!/usr/bin/env ruby2.5

# frozen_string_literal: true

require 'discordrb'
require 'json'

def signature(cmd)
  msg = "Usage: `!#{cmd[1..-1]}"
  params = method(cmd).parameters
  params.each do |type, name|
    if name.to_s != 'event'
      msg += type.to_s == 'req' ? " <#{name}>" : " [#{name}]"
    end
  end
  msg += '`'
end

def _help(event)
  event.send('suce')
end

def _poireau(event)
  event.send('jrv')
end

config_file = File.read("config.json")
config = JSON.parse(config_file)['bot']

bot = Discordrb::Bot.new(
  token: config['token']
)

bot.ready do
  puts "Logged in as `#{bot.profile.username}` (ID: #{bot.profile.id})"
end

bot.message do |event|
  if event.channel.name == 'botland'
    message = event.message.to_s
    if message.start_with?('!')
      elts = message.to_s[1..-1].split
      cmd = "_#{elts[0]}"
      cmd_args = [event].concat(elts[1..-1])
      begin
        send(cmd, *cmd_args)
      rescue NoMethodError
        event.send('mdr t ki ?')
      rescue ArgumentError
        event.send(signature(cmd))
      end
    end
  end
end

begin
  bot.run
rescue Interrupt
  puts "\rExiting"
end
