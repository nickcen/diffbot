module Diffbot
  
  # Represents any object which can be pulled directly from the Diffbot API.
  class Diffbot_Object
    
    # Must be overridden in subclasses
    ENT_NAME = "undefined"
    
    # Must be overridden in subclasses
    def self.get(url, options = {})
      j = API.single_entity(url, self::ENT_NAME, options)
      e = self.new(j)
      return e
    end
    
    # Compares two objects, returning true if they have the same url
    # (ie, represent the same entity). If you must ensure that the two objects
    # also contain the same data, you should also compare the updated_at
    # attributes.
    def ===(other)
      @url == other.url
    end
    
  end
end
