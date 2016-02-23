module Zara4::API::ImageProcessing
  class LocalImageRequest < Request
    
    
    def initialize(path_to_image)
      @path_to_image = path_to_image
    end    
    
    
    def generate_form_data
      data = super.generate_form_data()
      # add file to data
      return data
    end
    
    
  end  
end