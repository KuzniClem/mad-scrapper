# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'PRY'

def emails_finder
  page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  deputy_list_a = page.xpath('//*[@id="deputes-list"]//li/a/text()')
  deputy_names_a = deputy_list_a.map do |single_deputy_information|
    single_deputy_information.to_s.split.drop(1)
  end
  deputy_names_a.map do |first_name, last_name|
    email = first_name.downcase + '.' +
            last_name.downcase + '@assemblee-nationale.fr'
    Hash[first_name: first_name, last_name: last_name, email: email]
  end
end

def perform
  emails_finder
end

puts perform
