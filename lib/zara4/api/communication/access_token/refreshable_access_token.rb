module Zara4::API::Communication::AccessToken
  class RefreshableAccessToken < AccessToken
    
    attr_accessor :refresh_token
    
    
    #
    # Constructor
    #
    def initialize(client_id, client_secret, access_token, expires_at, refesh_token)
      super(client_id, client_secret, access_token, expires_at)
      @refresh_token = refresh_token
    end
    
    
    #
    # Refresh this ReissuableAccessToken
    #
    def refresh
      grant = RefreshTokenGrant.new(@client_id, @client_secret, @refresh_token, [])
      tokens = grant.get_tokens()
      
      @access_token  = tokens['access_tokens']
      @expires_at    = ''
      @refresh_token = tokens['refresh_token']
    end
    
    
  end
end