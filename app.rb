require "sinatra/base"
require "sinatra/reloader"
require_relative 'lib/post'

class MessageBoard < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect('/posts')
  end

  get '/test' do
    "Hello, world!"
  end

  get '/posts' do
    @posts = Post.show_all
    erb :posts
  end

  get '/posts/new' do
    erb :add_post
  end

  post '/posts/add' do
    Post.add(username: params[:name], title: params[:title], message: params[:message])
    session[:name] = params[:name].to_s
    session[:title] = params[:title].to_s
    session[:message] = params[:message].to_s
    redirect('/posts')
  end



  run! if app_file == $0
end

# In config.ru:
# require_relative "./app"
#
# run MessageBoard


# at the top of spec/spec_helper.rb:
# ENV['RACK_ENV'] = 'test'
#
# require File.join(File.dirname(__FILE__), '..', 'app.rb')
#
# require 'capybara'
# require 'capybara/rspec'
# require 'rspec'
#
# Capybara.app = MessageBoard
