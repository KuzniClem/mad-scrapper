require 'open-uri'
require 'nokogiri'
require 'PRY'

def get_townhall_email(townhall_url)
	Nokogiri::HTML(open("#{townhall_url}")).xpath('//tbody[1]//tr[4]/td[2]/text()').first.to_s
end

def get_townhall_url
  page_url = "http://www.annuaire-des-mairies.com/val-d-oise.html"
  page = Nokogiri::HTML(open("#{page_url}"))
  url_a = page.xpath('/html/body/table//tr[3]//tr[1]//td[2]//table[1]//tr[2]//tr//a/@href').map { |turl| turl.to_s }
  page.xpath('/html/body/table//tr[3]//tr[1]//td[2]//table[1]//tr[2]//tr//a/text()').map { |town_name|
		Hash["#{town_name.to_s}": get_townhall_email(page_url.gsub(/val-d-oise\.html/, '') + url.gsub(/\A\./, ''))]
 	}
  # binding.pry
end

def perform
	print get_townhall_url
end

perform
