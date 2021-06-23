require "sinatra/base"
require "sinatra/reloader"

class MessageBoard < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    "Hello, world!"
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
