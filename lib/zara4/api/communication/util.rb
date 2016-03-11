module Zara4::API::Communication
  class Util
      
    
    #
    # Get the url to the given path.
    #
    def self.url(path)
      return Zara4::API::Communication::Config::api_endpoint_url() + path
    end
    
    
    
    def post(target_url, data)
      
    end
    
    
    #
    # Calculate the expiry time from the given lifetime time.
    #
    def self.calculate_expiry_time(expires_in_seconds)
      expires_in_seconds = expires_in_seconds - 60
      return Time.now + expires_in_seconds
    end
    
    
  end
end