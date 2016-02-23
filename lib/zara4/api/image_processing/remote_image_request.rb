module Zara4::API::ImageProcessing
  class RemoteImageRequest < Request
    
    
    def initialize(url)
      @url = url
    end
    
    
    def generate_form_data
      data = super
      data['url'] = @url
      return data
    end
    
    
  end  
end