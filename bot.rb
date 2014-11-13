require 'sinatra'
require 'chatbot'

Chatbot.configure do |config|
  config.bot_id = ENV['BOT_ID']
end

post '/' do
  Chatbot.processMessage(request.body.read)
end

Chatbot.command "!roll" do |message|
  "#{message.sender} rolled a #{1 + rand(6)}"
end
