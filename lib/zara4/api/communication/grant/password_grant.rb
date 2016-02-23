module Zara4::API::Communication::Grant
  class PasswordGrant < GrantRequest
    
    attr_accessor :username, :password
    
    
    def initialize(client_id, client_secret, username, password, scopes)
      super(client_id, client_secret, scopes)
      @username = username
      @password = password
    end
    
    
    #
    # The type of this grant.
    #
    def grant_type
      return 'password'
    end
    
    
    #
    # Data to be sent when fetching grant tokens.
    #
    def data
      data = super.data
      data['username'] = @username
      data['password'] = @password
      return data
    end
    
  end
end