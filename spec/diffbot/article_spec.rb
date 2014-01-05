require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'json'

module Diffbot
  describe Article do
    let :article do 
      File.open(File.join(File.dirname(__FILE__), "..", "fixtures", "article.json")).read
    end

    it "should ask for JSON object" do
      API.should_receive(:single_entity).with("whatever", "article", {}).and_return(JSON.parse(article))
      article = Article.get("whatever")
    end
    
    it "should get information from supplied file" do
      API.should_receive(:single_entity).with("whatever", "article", {}).and_return(JSON.parse(article))
      article = Article.get("whatever")
      article.title.should == "Diffbot's New Product API Teaches Robots to Shop Online"
    end
    
    it "should return an icon" do
      API.should_receive(:single_entity).with("whatever", "article", {}).and_return(JSON.parse(article))
      article = Article.get("whatever")
      article.icon.should == "http://www.diffbot.com/favicon.ico"
    end
  end
end