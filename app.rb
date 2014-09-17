Bundler.require

require 'sinatra/asset_pipeline'
require 'sinatra/partial'

class App < Sinatra::Base
  configure do
    set :production, ENV['RACK_ENV'] == 'production'
  end

  set :assets_precompile, %w(application.js libs.js application.css bootstrap.css *.png *.jpg *.svg)
  register Sinatra::AssetPipeline

  register Sinatra::Partial
  set :partial_template_engine, :erb

  def initialize
    super

  end

  # Define urls like this, erb :file links to /views/file.erb
  get "/" do
    erb :index
  end

  get "/location" do
    erb :location
  end

  get "/susan" do
    erb :cfo_dash
  end

  get "/robert" do
    erb :acct_man_dash
  end
end