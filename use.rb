#!/usr/bin/env ruby

require "./lightning_ws"

client = LightningWs.new({
  max_amount: 1000,
  macaroon_path: ENV['MACAROON_PATH'],
  credentials_path: ENV['CREDENTIALS_PATH'],
  address: ENV['ADDRESS']
})

puts "Hello lightning.ws"
puts "Text to translate to english:"
text = gets
text.strip!
puts "Translating `#{text}`..."
puts client.translate(text)

#puts client.ocr("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Blocksatz-Beispiel_deutsch%2C_German_text_sample_with_fully_justified_text.svg/1500px-Blocksatz-Beispiel_deutsch%2C_German_text_sample_with_fully_justified_text.svg.png")

