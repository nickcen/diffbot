require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Diffbot
  describe API do

    it "should raise exception for missing API token" do
      token = API.token
      API.token = nil
      expect { API.fetch('http://www.xconomy.com/san-francisco/2012/07/25/diffbot-is-using-computer-vision-to-reinvent-the-semantic-web/', 'article') }.to raise_error
      API.token = token
    end

    it "should raise exception for incorrect entity name" do
      expect { API.single_entity("whatever", "wrong") }.to raise_error, "Unsupported Entity Types"
    end
  end
end