module Zara4::API::Communication::Authentication
  class Authenticator
    
    attr_accessor :client_id, :client_secret
    
    #
    # Constructor
    #
    def initialize(client_id, client_secret)
      @client_id     = client_id
      @client_secret = client_secret
      @scopes        = [];
    end
    
    
    #
    # Add image processing to the Authenticator scope.
    #
    def with_image_processing
      @scopes.push('image-processing')
      return self
    end
    
    
    #
    # Add reading account usage to the Authenticator scope.
    #
    def with_usage
      @scopes.push('usage')
      return self
    end
    
    
  end
end