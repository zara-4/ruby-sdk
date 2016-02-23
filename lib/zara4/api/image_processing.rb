module Zara4::API::ImageProcessing
end

require_relative './image_processing/colour_enhancement.rb'
require_relative './image_processing/optimisation_mode.rb'
require_relative './image_processing/output_format.rb'
require_relative './image_processing/resize_mode.rb'

require_relative './image_processing/request.rb'
require_relative './image_processing/remote_image_request.rb'
require_relative './image_processing/local_image_request.rb'
require_relative './image_processing/processed_image.rb'