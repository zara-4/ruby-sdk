module Zara4::API::Communication::Grant
  class ClientCredentialsGrantRequest < GrantRequest
    
    
    #
    # The type of this grant.
    #
    def grant_type
      return 'client_credentials'
    end
    
    
  end
end