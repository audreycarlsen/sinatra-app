require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    erb :index, :layout => false
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

  get '/blog/:post_name' do
    erb "/posts/#{params[:post_name]}".to_sym
  end

  get '/about' do
    erb :about
  end
end

# Fix about classes, unwanted links, headers, dropdown menu.