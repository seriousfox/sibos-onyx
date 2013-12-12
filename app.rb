Bundler.require

require 'sinatra/asset_pipeline'

class App < Sinatra::Base
  configure do
    set :production, ENV['RACK_ENV'] == 'production'
  end

  set :assets_precompile, %w(application.js libs.js application.css bootstrap.css *.png *.jpg *.svg)
  register Sinatra::AssetPipeline

  def initialize
    super
    
  end

  # Define urls like this, erb :file links to /views/file.erb
  get "/" do
    erb :index
  end

end