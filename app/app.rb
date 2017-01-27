ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    # tag = Tag.first_or_create(tags: params[:tags])
    tag = params[:tags]
    tag.split(", ").each do |tag|
      new_tag = Tag.create(tags: tag)
      link.tags << new_tag
    end
    link.save
    redirect '/links'
  end

  get '/tags' do
    erb :'tags/search'
  end

  get '/tags/filter' do
    @links = Link.all
    @search = params["Search tags"]
    erb :'tags/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/links')
    else
      flash.now[:notices] = @user.errors.full_messages
      erb :'users/new'
    end
    # if params[:password] == params[:password_confirmation]
    #   user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    #   session[:user_id] = user.id
    #   redirect to('/links')
    # else
    #   flash.now[:notice] = 'Password and confirmation password do not match'
    #   erb :'users/new'
    # end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
