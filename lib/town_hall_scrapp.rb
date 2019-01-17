require 'open-uri'
require 'nokogiri'
require 'PRY'

def get_townhall_email(townhall_url)
	Nokogiri::HTML(open("#{townhall_url}")).xpath('//tbody[1]//tr[4]/td[2]/text()').first.to_s
end

def get_townhall_url
  page_url = "http://www.annuaire-des-mairies.com/val-d-oise.html"
  page = Nokogiri::HTML(open("#{page_url}"))
  half_url_a = page.xpath('/html/body/table//tr[3]//tr[1]//td[2]//table[1]//tr[2]//tr//a/@href').map { |tmp_url| tmp_url.to_s }
  binding.pry
  complete_url_a = half_url_a.map { |tmp_url| "http://www.annuaire-des-mairies.com" +  }
  list_of_emails = complete_url_a.map { |tmp_url| get_townhall_email(tmp_url) }
  towns_a = page.xpath('/html/body/table//tr[3]//tr[1]//td[2]//table[1]//tr[2]//tr//a/text()').map { |town_name| town_name.to_s }
  town_contact_hash_a = towns_a.zip(list_of_emails).map { |town_name, tmp_url| Hash["#{town_name}": tmp_url] }
  binding.pry
end

def perform
	print get_townhall_url
end

perform
