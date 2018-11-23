require "faraday"
require "faraday_middleware"
require "faraday_ln_paywall"
require "logger"
require "json"

class LightningWs
  HOST = 'https://api.lightning.ws/'

  def initialize(lightning_options = {})
    @lightning_options = lightning_options
  end

  def qr(data)
    connection.get('/qr', { data: data }).body
  end

  def translate(text, to="en")
    connection.get('/translate', { text: text, to: to }).body
  end

  def ocr(imageUrl)
    connection.get('/ocr', { imageUrl: imageUrl }).body
  end

  def connection
    @connection ||= Faraday.new(:url => HOST) do |conn|
      conn.use FaradayLnPaywall::Middleware, @lightning_options
      conn.response :json, :content_type => /\bjson$/
      conn.adapter  Faraday.default_adapter
    end
  end
end
