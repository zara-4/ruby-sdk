module Zara4::API::Communication::AccessToken
  class ReissuableAccessToken < AccessToken
    
    attr_accessor :scopes
    
    
    #
    # Constructor
    #
    def initialize(client_id, client_secret, access_token, expires_at, scopes)
      super(client_id, client_secret, access_token, expires_at)
      @scopes = scopes
    end
    
    
    #
    # Refresh this ReissuableAccessToken
    #
    def refresh
      grant = ClientCredentialsGrantRequest.new(@client_id, @client_secret, @scopes)
      tokens = grant.get_tokens()
      
      @access_token = tokens['access_token']
      @expires_at   = tokens['expires_in']
    end
    
    
  end
end