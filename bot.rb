require 'sinatra'
require 'chatbot'

DIE_SIDES = ENV['DIE_SIDES'].to_i

def roll
  1 + rand(DIE_SIDES)
end

Chatbot.configure do |config|
  config.bot_id = ENV['BOT_ID']
end

post '/' do
  Chatbot.processMessage(request.body.read)
end

Chatbot.command "!roll" do |message|
  "#{message.sender} rolled a #{roll} and a #{roll}"
end
