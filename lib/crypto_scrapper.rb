# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'PRY'

def crypto_scrapper
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  id = page.xpath('//*[@id="currencies-all"]
  	/tbody/tr/td[2]/span//text()').map(&:text)
  value = page.xpath('//*[@id="currencies-all"]
  	/tbody/tr/td[5]/a/text()').map(&:text)

  id.zip(value).map { |t_id, t_value| Hash[t_id, t_value] }
end

def perform
  print crypto_scrapper
end

perform
