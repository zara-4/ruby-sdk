module Zara4::API::ImageProcessing
  class Request
    
    attr_accessor :optimisation_mode, :output_format, :resize_mode, :colour_enhancement, :width, :height
    
    #
    # Constructor
    #
    def initialize(optimisation_mode=nil, output_format=nil, colour_enhancement=nil, resize_mode=nil, width=100, height=100)
      
      if optimisation_mode != nil
        @optimisation_mode = optimisation_mode
      else
        @optimisation_mode = Zara4::API::ImageProcessing::OptimisationMode::COMPROMISE 
      end
      
      if output_format != nil
        @output_format = output_format
      else
        @output_format = Zara4::API::ImageProcessing::OutputFormat::MATCH
      end
      
      if colour_enhancement != nil
        @colour_enhancement = colour_enhancement
      else
        @colour_enhancement = Zara4::API::ImageProcessing::ColourEnhancement::NONE
      end
      
      if resize_mode != nil
        @resize_mode = resize_mode
      else
        @resize_mode = Zara4::API::ImageProcessing::ResizeMode::NONE
      end
      
      @width = width
      @height = height      
      
    end   
    
    
    #
    # Generate the form data for this request
    #
    def generate_form_data
      data = {
        'optimisation-mode'  => @optimisation_mode,
        'output-format'      => @output_format,
        'colour-enhancement' => @colour_enhancement,
        'resize-mode'        => @resize_mode
      }
      
      # Only include width and height if resize requested
      if @resize_mode != nil && @resize_mode != Zara4::API::ImageProcessing::ResizeMode::NONE
        data['width']  = @width
        data['height'] = @height
      end
      
      return data
    end
    
    
  end  
end