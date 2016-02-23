module Zara4::API::Communication::AccessToken
  class AccessToken
    
    attr_accessor :client_id, :client_secret, :access_token, :expires_at
    
    
    #
    # Constructor
    #
    def initialize(client_id, client_secret, access_token, expires_at)
      @client_id     = client_id
      @client_secret = client_secret
      @access_token  = access_token;
      @expires_at    = expires_at
    end
        
    
    #
    # Get the token
    #
    def token
      if has_expired()
        refresh()
      end
      return @access_token
    end

    
    #
    # Refresh this AccessToken
    #
    def refresh
      # Stub to be implemented
    end
    
    
    #
    # Has this AccessToken expired?
    #
    def has_expired
      return Time.now > @expires_at
    end    
    
    
  end
end