class HomeController < ApplicationController
  def index
    if user_signed_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page],:per_page => 5)
    end
  end
  

  def show

  end
end
