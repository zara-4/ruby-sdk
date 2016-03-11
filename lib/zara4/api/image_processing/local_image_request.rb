module Zara4::API::ImageProcessing
  class LocalImageRequest < Request
    
    
    def initialize(path_to_image, optimisation_mode=nil, output_format=nil, colour_enhancement=nil, resize_mode=nil, width=100, height=100)
      super(optimisation_mode, output_format, colour_enhancement, resize_mode, width, height)
      @path_to_image = path_to_image
    end    
    
    
    def generate_form_data
      data = super
      data['file'] = File.new(@path_to_image)
      return data
    end
    
    
  end  
end