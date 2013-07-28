require 'sinatra'
require_relative 'api/weather'
require_relative 'api/tube'
require_relative 'api/news'

ENV['RACK_ENV'] ||= 'development'

class Glance < Sinatra::Base

  configure do
    set :root, File.dirname(__FILE__)
    if ENV['RACK_ENV'] == 'development'
      set :public_folder, File.join(root, 'app')
    else
      set :public_folder, File.join(root, 'dist')
    end
  end

  use WeatherApi
  use TubeApi
  use NewsApi

end
