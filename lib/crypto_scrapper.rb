require 'open-uri'
require 'nokogiri'
require 'PRY'

def crypto_scrapper
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	id = page.xpath('//*[@id="currencies-all"]/tbody/tr/td[2]/span//text()').map { |id| id.text }
	value = page.xpath('//*[@id="currencies-all"]/tbody/tr/td[5]/a/text()').map { |value| value.text }

	id.zip(value).map { |id, value| Hash[id, value] }
end

def perform
	crypto_scrapper
end

perform


# //*[@id="id-bitcoin"]/td[2]