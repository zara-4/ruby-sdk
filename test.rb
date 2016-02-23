require 'zara4'

client = Zara4::API::Client.new({
  'client_id'     => 'YOUR_API_CLIENT_ID',
  'client_secret' => 'YOUR_API_CLIENT_SECRET'
})
original_image = Zara4::API::ImageProcessing::RemoteImageRequest.new('https://zara4.com/img/comparison/beach/original.jpg')
processed_image = client.process_image(original_image)