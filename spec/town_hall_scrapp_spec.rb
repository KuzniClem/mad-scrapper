# frozen_string_literal: true

require_relative '../lib/town_hall_scrapp'

describe 'city contact method' do
  it 'return Array ?' do
    expect(get_townhall_url).to be_instance_of Array
  end
end

describe 'email method' do
  it 'return String ?' do
    url = 'http://annuaire-des-mairies.com/95/avernes.html'
    expect(get_townhall_email(url)).to be_instance_of String
  end
end
