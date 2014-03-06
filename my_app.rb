require 'sinatra'
require 'yaml'

class MyApp < Sinatra::Base

  before do
    @posts = Dir.glob('views/posts/*.erb').map do |post_name|
      post_name.split('/').last.slice(0..-5)
    end
    @sorted_posts = meta_data.sort_by { |post, date_hash| date_hash["date"] }.reverse
  end

  get '/' do
    erb :index, layout: false
  end

  get '/digital' do
    erb :digital
  end

  get '/radio' do
    erb :radio
  end

  get '/blog/:post_name' do
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