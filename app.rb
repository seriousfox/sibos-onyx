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
    @user = nil
  end

  # Define urls like this, erb :file links to /views/file.erb
  get "/" do
    erb :index
  end

  get "/location/:user" do
    @user = params[:user]
    erb :location, :layout => !request.pjax?
  end

  get "/face/:user" do
    @user = params[:user]
    erb :face, :layout => !request.pjax?
  end

  get "/voice/:user" do
    @user = params[:user]
    erb :audio, :layout => !request.pjax?
  end

  get "/susan" do
    @payment = nil
    erb :cfo_dash, :layout => !request.pjax?
  end

  get "/susan/:payment" do
    @payment = params[:payment]
    erb :cfo_dash, :layout => !request.pjax?
  end

  get "/robert/:transfer" do
    @transfer = params[:transfer]
    erb :acct_man_dash, :layout => !request.pjax?
  end

  get "/robert" do
    @transfer = nil
    erb :acct_man_dash, :layout => !request.pjax?
  end

  get "/payment_research" do
    erb :payment_research, :layout => !request.pjax?
  end

  get "/payment_transfer" do
    erb :payment_transfer, :layout => !request.pjax?
  end

  get "/car-sales" do
    erb :car_sales
  end
end