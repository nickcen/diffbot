module Diffbot
  # Represents an Artile listed in the Diffbot.
  class Article < Diffbot_Object
    
    ENT_NAME = "article"
    
    attr_reader :url, :resolved_url, :icon, :meta, :querystring,
      :links, :type, :title, :text,
      :html, :numPages, :date, :author, 
      :tags, :humanLanguage, :images, :videos
    
    def initialize(json)
      @url = json["url"]
      @resolved_url = json["resolved_url"]
      @icon = json["icon"]
      @meta = json["meta"]
      @querystring = json["querystring"]
      @links = json["links"]
      @type = json["type"]
      @title = json["title"]
      @text = json["text"]
      @html = json["html"]
      @numPages = json["numPages"]
      @date = json["date"]
      @author = json["author"]
      @tags = json["tags"]
      @humanLanguage = json["humanLanguage"]
      @images = json["images"]
      @videos = json["videos"]
    end
  end
end
