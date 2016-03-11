require 'zara4'

Zara4::API::Communication::Config::enter_development_mode()

client = Zara4::API::Client.new({
  'client_id'     => '9WQcfHDyd8BIJc9tg2Yx6qSjHn8bvKyPbFs',
  'client_secret' => 'Ua25inHBHWWwExMb4Xymb9k7K9l8f2I2X4h'
})


#
# Test RemoteImageRequest
#
original_image = Zara4::API::ImageProcessing::RemoteImageRequest.new('https://zara4.com/img/comparison/beach/original.jpg')
processed_image = client.process_image(original_image)
client.download_processed_image(processed_image, 'test/remote.jpg')


#
# Test LocalImageRequest
#
original_image = Zara4::API::ImageProcessing::LocalImageRequest.new('test/test-images/001.jpg')
processed_image = client.process_image(original_image)
client.download_processed_image(processed_image, 'test/local.jpg')