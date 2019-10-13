class HomeController < ApplicationController
  protect_from_forgery
  require 'net/http'
  require 'uri'
  require 'json'
  def index
    if user_signed_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page],:per_page => 5)
    end
  end
  

  def show
    
    ur = params[:food].to_s
    urh = 'https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=3b0aa19c029fbf07ed9b5e2fbafb6c4f&name='
    urh += ur
    uri = URI.encode(urh)
    url= URI.parse(uri)
    json = Net::HTTP.get(url)
    @result = JSON.parse(json)
    unless @result["rest"].nil?
    @result_name = @result["rest"].map{|a|a["name"]}
    @result_url = @result["rest"].map{|b|b["url"]}
    @result_image_url = @result["rest"].map{|c|c["image_url"]["shop_image1"]}
    
    end
    
  end

  def word
    ur = params[:word].to_s
    urh = 'https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=3b0aa19c029fbf07ed9b5e2fbafb6c4f&freeword='
    urh += ur
    uri = URI.encode(urh)
    url= URI.parse(uri)
    json = Net::HTTP.get(url)
    @result = JSON.parse(json)
    unless @result["rest"].nil?
    @result_name = @result["rest"].map{|a|a["name"]}
    @result_url = @result["rest"].map{|b|b["url"]}
    @result_image_url = @result["rest"].map{|c|c["image_url"]["shop_image1"]}
    end
  end
  def  post

  end
  
  def search

  end
end
