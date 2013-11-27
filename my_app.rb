require 'sinatra'

class MyApp < Sinatra::Base
  before do
    @posts = Dir.glob('views/posts/*.erb').map do |post_name|
      post_name.split('/').last.slice(0..-5)
    end
  end

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

  get '/blog' do
    erb :blog, :layout => :blog_layout
  end

  get '/blog/:post_name' do
    erb "/posts/#{params[:post_name]}".to_sym, :layout => :blog_layout
  end

  get '/about' do
    erb :about
  end
end

# Fix about classes, unwanted links, headers, dropdown menu.