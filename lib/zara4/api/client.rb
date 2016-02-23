require 'json'
require 'httparty'

module Zara4::API
  class Client
    include HTTParty
    
    attr_accessor :client_id, :client_secret
    
    
    #
    # Application authenticated client.
    #
    def initialize(credentials)
      @client_id     = credentials.fetch('client_id')
      @client_secret = credentials.fetch('client_secret')
      
      if @client_id && @client_secret
        authenticator = Zara4::API::Communication::Authentication::ApplicationAuthenticator.new(@client_id, @client_secret)
        authenticator.with_image_processing().with_usage()
        @access_token = authenticator.acquire_access_token()
      end
    end


    #
    # Process the given image processing Request.
    #
    # @param image_processing_request The request to be processed
    #
    def process_image(image_processing_request)
      url = Zara4::API::Communication::Util::url('/api/image-processing/optimise')
     
      parameters = image_processing_request.generate_form_data
      parameters['access_token'] = @access_token.token
      
      headers = {
        'Content-Type'  => 'application/json'
      }     
     
      response = self.class.post(url, {
        body: parameters.to_json,
        headers: headers
      })
      
      # Check for API error response
      if response.has_key?('error')
        puts 'ERROR IS ' + response.fetch('error')
      end
           
      
      request_id                = response['request-id']
      generate_images_urls      = response['generated-images']['urls']
      bytes_original            = response['compression']['bytes-original']
      bytes_compressed          = response['compression']['bytes-compressed']
      
      return Zara4::API::ImageProcessing::ProcessedImage.new(image_processing_request, request_id, generate_images_urls, bytes_original, bytes_compressed)
    end


    #
    # Download the given ProcessedImage and save it to the given path.
    # 
    # @param processed_image The ProcessedImage to be downloaded.
    # @param save_path The path where the image should be saved.
    #
    def download_processed_image(processed_image, save_path)
      
      url = ''
      
      if @access_token
        url += '?access_token' + @access_token.token()
      end
      
    end


  end
end