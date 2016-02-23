module Zara4::API::Communication::Authentication
  class UserAuthenticator < Authenticator
    
    
    attr_accessor :client_id, :client_secret, :username, :password
    
    
    #
    # Constructor
    #
    def initialize(client_id, client_secret, username, password)
      super.initialize(client_id, client_secret)
      @username = username
      @password = password
    end
    
    
    #
    # Acquire an AccessToken using this UserAuthenticator.
    #
    def acquire_access_token
      grant = Zara4::API::Communication::Grant::ClientCredentialsGrantRequest.new(@client_id, @clint_secret, @scopes)
      tokens = grant.getTokens()
        
      access_token  = tokens['access_token']
      refresh_token = tokens['refresh_token']
      expires_at    = Zara4::API::Communication::Util::calculate_expiry_time(tokens['expires_in'])
      
      return Zara4::API::Communication::AccessToken::RefreshableAccessToken.new(@client_id, @client_secret, access_token, expires_at, refresh_token)
    end
    
    
  end
end