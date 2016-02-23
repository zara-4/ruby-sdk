module Zara4::API::Communication::Grant
  class RefreshTokenGrant < GrantRequest
    
    attr_accessor :refresh_token
    
    
    def initialize(client_id, client_secret, refresh_token, scopes)
      super(client_id, client_secret, scopes)
      @refresh_token = refresh_token
    end
    
    
    #
    # The type of this grant.
    #
    def grant_type
      return 'refresh_token'
    end
    
    
    #
    # Data to be sent when fetching grant tokens.
    #
    def data
      data = super.data()
      data['refresh_token'] = @refresh_token
    end
    
    
  end
end