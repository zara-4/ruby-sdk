$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'zara4'

spec = Gem::Specification.new do |s|
  s.name = 'zara4'
  s.version = Zara4::API::VERSION
  s.required_ruby_version = '>= 1.9.3'
  s.summary = 'Ruby SDK for the Zara 4 image compression API'
  s.description = 'Zara 4 compresses and optimizes your images'
  s.authors = ['Colin Stannard']
  s.email = ['support@zara4.com', 'colin.stannard@cbsindustries.com']
  s.homepage = 'https://github.com/zara-4/ruby-sdk'
  s.files = Dir["lib/**/*.rb"]
  s.require_paths = ['lib']
  s.license = 'MIT'

  s.add_dependency('json', '~> 1.8')
  s.add_dependency('httmultiparty', '~> 0.3.13')
  
end