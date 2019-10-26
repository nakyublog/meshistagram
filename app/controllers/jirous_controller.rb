class JirousController < ApplicationController
  before_action :authenticate_user!	
   protect_from_forgery
  require 'net/http'
  require 'uri'
  require 'json'
  def index

  end
    
    
  
  def create
    if current_user.jirous.count <=4
    @jirou = Jirou.new(jirou_params)
      if @jirou.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
      
      render 'jirous/shoplist'
      end
    else
      flash[:success] = "お気に入りは５個まで"
      redirect_to root_url
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
    redirect_to action: 'wordlist'
    end


  end
  def  post
      
  end
  
  def search

  end
  def shoplist
    
    urh = 'https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=3b0aa19c029fbf07ed9b5e2fbafb6c4f&name='
    urh += params[:food].to_s
    urh += params[:pref].to_s
    uri = URI.encode(urh)
    url= URI.parse(uri)
    json = Net::HTTP.get(url)
    @result = JSON.parse(json)
    unless @result["rest"].nil?
    @result_name = @result["rest"].map{|a|a["name"]}
    @result_url = @result["rest"].map{|b|b["url"]}
    @result_image_url = @result["rest"].map{|c|c["image_url"]["shop_image1"]}

    @jirou = current_user.jirous.build
    end
  end

  def wordlist
        urh = 'https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=3b0aa19c029fbf07ed9b5e2fbafb6c4f&freeword='
    urh += params[:food].to_s
    urh += params[:pref].to_s
    uri = URI.encode(urh)
    url= URI.parse(uri)
    json = Net::HTTP.get(url)
    @result = JSON.parse(json)
    unless @result["rest"].nil?
    @result_name = @result["rest"].map{|a|a["name"]}
    @result_url = @result["rest"].map{|b|b["url"]}
    @result_image_url = @result["rest"].map{|c|c["image_url"]["shop_image1"]}

    @jirou = current_user.jirous.build
    end

  end

  def destroy
      @jirou = Jirou.find(params[:id])
      @jirou.destroy
      redirect_to root_path


  end
  private

    def jirou_params
      params.require(:jirou).permit(:name, :url , :user_id, :image_url)
    end
end
