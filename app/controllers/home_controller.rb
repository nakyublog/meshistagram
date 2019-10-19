class HomeController < ApplicationController
   protect_from_forgery
  require 'net/http'
  require 'uri'
  require 'json'
  def index
    if user_signed_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page],:per_page => 5)
    @jirou = current_user.jirous
  end
end
  


  
end
