require 'nokogiri'
require 'open-uri'

def fetch_crypto_data
  url = 'https://www.coingecko.com/'
  page = Nokogiri::HTML(URI.open(url)) 

  crypto_array = []

 
  crypto_names = page.css('a.tw-hidden') 
  crypto_prices = page.css('.no-wrap')   

  
  crypto_names.each_with_index do |name, index|
    break if index >= crypto_prices.length 
    price = crypto_prices[index].text.delete('$,').to_f
    crypto_array << { name.text.strip => price }
  end

  puts "Scraping terminé, #{crypto_array.size} cryptomonnaies récupérées."
  crypto_array
end


if __FILE__ == $PROGRAM_NAME
  puts fetch_crypto_data
end
