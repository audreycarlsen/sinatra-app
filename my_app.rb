require 'sinatra'
require 'yaml'

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
    page = erb("/posts/#{params[:post_name]}".to_sym, layout: false)
    page_body = page.split("\n\n", 2).last
    erb page_body
  end

  def meta_data
    if @meta_data
      @meta_data
    else
      @meta_data = {}
      @posts.each do |post|
        html = erb("/posts/#{post}".to_sym, layout: false)
        meta = YAML.load(html.split("\n\n", 2).first)
        @meta_data[post] = meta
      end
      @meta_data
    end
  end

  get '/about' do
    erb :about
  end

end

# Fix headers, dropdown menu, accessibility organization.