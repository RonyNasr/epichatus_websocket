require("bundler/setup")
require 'rack-flash'

Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'sinatra/base'
require './middlewares/chat_backend'

include BCrypt
use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :expire_after => 3600, # Signs out after 1 hour of inactivity
                           :secret => 'secrets_are_no_fun'
use Rack::Flash

# module ChatDemo
#   class App < Sinatra::Base

    # actual routes begin here for Epichat -->

    get('/') do
      # @users = User.all()
      erb :"index.html"
    end

    get "/assets/js/application.js" do # im sure there will be issues here -- >
      content_type :js
      @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
      erb :"application.js"
    end

    get '/user' do
      if User.find_by_id(session[:id])
        @user = User.find(session[:id])
        @users = User.all()
        @conversations = @user.conversations
        erb(:"user.html")
      else
        flash[:notice] = "You have been signed out due to inactivity"
        redirect '/'
      end
    end

    post '/signup/?' do
      if User.find_by email: params['signup_email']
        flash[:notice] = "That email is already registered to an account"
        redirect '/'
      elsif User.find_by username: params['signup_username']
        flash[:notice] = 'That username is taken'
        redirect '/'
      else
        secure_password = Password.create(params['signup_password'])
        @user = User.create({username: params['signup_username'], email: params['signup_email'], password: secure_password})
        session[:id] = @user.id
        redirect '/user'
      end
    end

    post '/login/?' do
      if user = User.authenticate(params)
        @user = user
        session[:id] = @user.id
        redirect '/user'
      else
        flash[:notice] = "Invalid username or password."
        redirect '/'
      end
    end

    post '/logout/?' do
      session.clear
      flash[:notice] = "You have succesfully signed out"
      redirect '/'
    end
#   end
# end
