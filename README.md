# Ruby client for lightning.ws services

This is an example of a ruby client for webservices provided by [lightning.ws](lightning.ws)

It uses the [lightning faraday middleware](https://github.com/bumi/faraday_ln_paywall/) to handle the lightning payments.

## Usage

See use.rb example. 

you can run the example by: 

    $ bundle install # install dependencies
    $ ruby use.rb

To configure your lightning node set environment variables:

    $ MACAROON_PATH=/path/admin.macaroon CREDENTIALS_PATH=/path/tls.cert ADDRESS=host:port ruby use.rb

```ruby
require "./lightning_ws"

client = LightningWs.new({
  max_amount: 1000,
  macaroon_path: ENV['MACAROON_PATH'],
  credentials_path: ENV['CREDENTIALS_PATH'],
  address: ENV['ADDRESS']
})

puts client.translate("hallo welt")
puts client.ocr("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Blocksatz-Beispiel_deutsch%2C_German_text_sample_with_fully_justified_text.svg/1500px-Blocksatz-Beispiel_deutsch%2C_German_text_sample_with_fully_justified_text.svg.png")

```
