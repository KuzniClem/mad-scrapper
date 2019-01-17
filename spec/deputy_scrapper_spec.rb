require_relative '../lib/deputy_scrapper'

describe "The representative contact method" do
  it "should return an array" do
      x = get_deputy_email
     expect(x).to be_instance_of Array
  end
  it "should have an array with 577 elements" do
      x = get_deputy_email
     expect(x).to have_attributes(length: 577)
  end
end