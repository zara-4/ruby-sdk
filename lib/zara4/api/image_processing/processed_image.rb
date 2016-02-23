module Zara4::API::ImageProcessing
  class ProcessedImage
    
    
    def initialize(request, request_id, file_urls, original_file_size, compressed_file_size)
      @request              = request
      @request_id           = request_id
      @file_urls            = file_urls
      @original_file_size   = original_file_size
      @compressed_file_size = compressed_file_size
    end   
    
    
    #
    # Get the file size (in bytes) of the original uncompressed image.
    #
    def original_file_size
      return @original_file_size
    end
    
    
    #
    # Get the file size (in bytes) of the compressed image.
    #
    def compressed_file_size
      return @compressed_file_size
    end
    
    
    #
    # Get the ratio by which the image has been compressed.
    #
    def compression_ratio
      return @compressed_file_size / @original_file_size
    end
    
    
    #
    # The percentage compression achieved.
    #    
    def percentage_saving
      return (1 - compression_ratio()) * 100
    end
    
    
    #
    # Was the original image compressed?
    #
    def compression_was_achieved
      return compression_ratio() < 1
    end
    
    
  end  
end