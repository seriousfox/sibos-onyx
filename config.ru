$LOAD_PATH << File.expand_path(".")
require 'bundler'
Bundler.setup
Bundler.require

use Rack::Deflater
require 'app'

map '/' do
  run App.new
end