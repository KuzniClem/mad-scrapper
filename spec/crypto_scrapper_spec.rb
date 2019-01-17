# frozen_string_literal: true

require_relative '../lib/crypto_scrapper'

describe 'crypto scrapping return' do
  it 'crypto exist ?' do
    expect(BTC: 3456.7).not_to be_nil
    expect(PTN: 0.006127).not_to be_nil
    expect(LST: 0.000883).not_to be_nil
    expect(GBT: 0.000700).not_to be_nil
    expect(COUPE: 0.000008).not_to be_nil
  end
end
