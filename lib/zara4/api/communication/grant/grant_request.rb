module Zara4::API::Communication::Grant
  class GrantRequest
    include HTTParty
    
    
    attr_accessor :client_id, :client_secret, :scopes
    
    
    #
    # Constructor
    #
    def initialize(client_id, client_secret, scopes)
      @client_id     = client_id
      @client_secret = client_secret
      @scopes        = scopes
    end
    
    
    #
    # Get tokens from the API
    #
    def get_tokens

      url = Zara4::API::Communication::Util::url('/oauth/access_token')
      
      parameters = {
        'grant_type'    => grant_type(),
        'client_id'     => @client_id,
        'client_secret' => @client_secret,
        'scope'         => @scopes.join(','),
      }
      
      headers = {
        'Content-Type'  => 'application/json'
      }
      
      response = self.class.post(url, {
        body: parameters.to_json,
        headers: headers
      })
      
      
      # Check for API error response
      if response.has_key?('error')
        puts 'ERROR IS ' + response.fetch('error')
      end
      
      return {
        'access_token' => response.fetch('access_token'),
        'expires_in'   => response.fetch('expires_in'),
      }
    end
    
    
    #
    # Add image processing to the request scope.
    #
    def with_image_processing
      @scopes.push('image-processing')
    end
    
    
    #
    # Add usage to the request scope.
    #
    def with_usage
      @scopes.push('usage')
    end
    
    
  end
end