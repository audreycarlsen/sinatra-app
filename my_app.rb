require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/print' do
    erb :print
  end

  get '/radio' do
    erb :radio
  end

  get '/this_carleton_life' do
    erb :this_carleton_life
  end

  get '/contact' do
    erb :contact
  end
end