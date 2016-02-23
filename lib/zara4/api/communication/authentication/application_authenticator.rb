module Zara4::API::Communication::Authentication
  class ApplicationAuthenticator < Authenticator
    
    
    #
    # Acquire an AccessToken using this ApplicationAuthenticator.
    #
    def acquire_access_token
      grant = Zara4::API::Communication::Grant::ClientCredentialsGrantRequest.new(@client_id, @client_secret, @scopes)
      tokens = grant.get_tokens()
      
      access_token = tokens['access_token']
      expires_at   = Zara4::API::Communication::Util::calculate_expiry_time(tokens['expires_in'])
      
      return Zara4::API::Communication::AccessToken::ReissuableAccessToken.new(@client_id, @client_secret, access_token, expires_at, @scopes)      
    end
    
    
  end
end