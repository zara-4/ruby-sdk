# Ruby SDK



## Installation

To install the [Zara 4 Ruby SDK gem](https://rubygems.org/gems/zara4) run:

```
gem install zara4
```




## Example Usage

```ruby
require 'zara4'


client = Zara4::API::Client.new({
  'client_id'     => 'YOUR_API_CLIENT_ID',
  'client_secret' => 'YOUR_API_CLIENT_SECRET'
})


#
# RemoteImageRequest
#
original_image = Zara4::API::ImageProcessing::RemoteImageRequest.new('https://zara4.com/img/comparison/beach/original.jpg')

original_image.optimisation_mode  = Zara4::API::ImageProcessing::OptimisationMode::HIGHEST
original_image.output_format      = Zara4::API::ImageProcessing::OutputFormat::MATCH
original_image.colour_enhancement = Zara4::API::ImageProcessing::ColourEnhancement::IMPROVE_COLOUR
original_image.resize_mode        = Zara4::API::ImageProcessing::ResizeMode::CROP
original_image.width              = 250
original_image.height             = 250

processed_image = client.process_image(original_image)
client.download_processed_image(processed_image, 'test/remote.jpg')


#
# LocalImageRequest
#
original_image = Zara4::API::ImageProcessing::LocalImageRequest.new('test/test-images/001.jpg')
processed_image = client.process_image(original_image)
client.download_processed_image(processed_image, 'test/local.jpg')
```