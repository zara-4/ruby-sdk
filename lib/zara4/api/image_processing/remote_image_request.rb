module Zara4::API::ImageProcessing
  class RemoteImageRequest < Request
    
    
    def initialize(url, optimisation_mode=nil, output_format=nil, colour_enhancement=nil, resize_mode=nil, width=100, height=100)
      super(optimisation_mode, output_format, colour_enhancement, resize_mode, width, height)
      @url = url
    end
    
    
    def generate_form_data
      data = super
      data['url'] = @url
      return data
    end
    
    
  end  
end