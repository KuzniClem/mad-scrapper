# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'PRY'

def em_finder(townhall_url)
  Nokogiri::HTML(open(townhall_url.to_s)).xpath('//tbody[1]
    //tr[4]/td[2]/text()').first.to_s
end

def url_finder
  page_url = 'http://www.annuaire-des-mairies.com/val-d-oise.html'
  page = Nokogiri::HTML(open(page_url.to_s))
  url_a = page.xpath('/html/body
    /table//tr[3]//tr[1]//td[2]//table[1]//tr[2]//tr//a/@href').map(&:to_s)
  names_a = page.xpath('/html/body
    /table//tr[3]//tr[1]//td[2]//table[1]//tr[2]//tr//a/text()').map(&:to_s)
  url_a.zip(names_a).map do |turl, town_name|
    Hash["#{town_name.to_s}": em_finder(page_url.gsub(/val-d-oise\.html/, '') +
      turl.gsub(/\A\./, ''))]
  end
end

def perform
  print url_finder
end

perform
