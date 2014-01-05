# -*- coding: utf-8 -*-
require 'faraday'

begin
  require 'yajl'
rescue LoadError
  require 'json'
end

module Diffbot

  # Handles the actual calls to the Diffbot API through a series of class
  # methods, each referring to a Diffbot entity type. Each method returns the raw
  # JSON returned from the API. You should probably be using the factory
  # methods provided on each entity class instead of calling these directly.
  class API
    Diffbot_URL = 'http://api.diffbot.com/v2/'
    SUPPORTED_ENTITIES = ['article']
    @timeout_limit = 60
    
    class << self; attr_accessor :timeout_limit, :token end
    
    def self.single_entity(url, entity_name, options = {})
      raise DiffbotException, "Unsupported Entity Type" unless SUPPORTED_ENTITIES.include?(entity_name)
      fetch(url, entity_name, options)
    end
    
    private
    
    # Returns the JSON parser, whether that's an instance of Yajl or JSON
    def self.parser
      if defined?(Yajl)
        Yajl::Parser
      else
        JSON
      end
    end

    # Fetches URI for the permalink interface.
    def self.fetch(url, object_name, options = {})
      uri = Diffbot_URL + "#{object_name}"
      get_json_response(uri, options.merge({:url => url}))
    end
    
    # Gets specified URI, then parses the returned JSON. Raises Timeout error 
    # if request time exceeds set limit. Raises DiffbotException if returned
    # JSON contains an error.
    def self.get_json_response(uri, params)
      raise DiffbotException, "API token required, visit http://www.diffbot.com/products/" unless @token

      conn = Faraday.new(:url => uri) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

      resp = conn.post do |req|
        req.options.timeout = @timeout_limit
        req.body = params.to_json
      end
      
      j = parser.parse(resp.body)
      # raise DiffbotException, j["error"] if j.class == Hash && j["error"]
      j
    end
  end
end
