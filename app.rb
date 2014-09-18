Bundler.require

require 'sinatra/asset_pipeline'
require 'sinatra/partial'

class Sinatra::Request
  def pjax?
    env['HTTP_X_PJAX'] || self['_pjax']
  end
end

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

  get "/location/:user" do
    erb :location, :layout => !request.pjax?
  end

  get "/face" do
    erb :face, :layout => !request.pjax?
  end

  get "/audio" do
    erb :audio, :layout => !request.pjax?
  end

  get "/susan" do
    erb :cfo_dash
  end

  get "/robert" do
    erb :acct_man_dash
  end

  get "/car-sales" do
    erb :car_sales
  end
end