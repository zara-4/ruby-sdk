module Zara4::API::ImageProcessing
  class Request
    
    @optimisation_mode = Zara4::API::ImageProcessing::OptimisationMode::COMPROMISE
    @output_format = Zara4::API::ImageProcessing::OutputFormat::MATCH
    @resize_mode = Zara4::API::ImageProcessing::ResizeMode::NONE
    @colour_enhancement = Zara4::API::ImageProcessing::ColourEnhancement::NONE
    
    
    attr_accessor :optimisation_mode, :output_format, :resize_mode, :colour_enhancement
    
    def initialize(optimisation_mode, output_format, resize_mode,
      colour_enhancement)
      @optimisation_mode  = optimisation_mode
      @output_format      = output_format
      @resize_mode        = resize_mode
      @colour_enhancement = colour_enhancement
    end   
    
    
    #
    # Generate the form data for this request
    #
    def generate_form_data
      return {
        'optimisation-mode'  => @optimisation_mode,
        'output-format'      => @output_format,
        'resize-mode'        => @resize_mode,
        'colour-enhancement' => @colour_enhancement,
      }
    end
    
    
  end  
end