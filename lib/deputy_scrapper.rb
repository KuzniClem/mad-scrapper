require 'open-uri'
require 'nokogiri'
require 'PRY'

def get_deputy_email
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	deputy_list_a = page.xpath('//*[@id="deputes-list"]//li/a/text()')
	deputy_names_a = deputy_list_a.map { |single_deputy_information| single_deputy_information.to_s.split.drop(1) }
	binding.pry
	deputy_contact_a = deputy_names_a.map { |first_name, last_name|
		Hash[first_name: first_name, last_name: last_name, email: first_name.downcase + '.' + last_name.downcase + '@assemblee-nationale.fr']
	}
	# binding.pry
end

def perform
	get_deputy_email
end

puts perform
