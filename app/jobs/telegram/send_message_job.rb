class Telegram::SendMessageJob < ApplicationJob
  queue_as :default

  def perform(text)
    token = '1500689205:AAEto5Enm8v39p7Yrnn2pZuaxZzs4x0sZ0M'
    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: -492_602_665, text: text)
    end
  end
end
