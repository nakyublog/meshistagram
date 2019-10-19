class MicropostsController < ApplicationController
  def index
    @microposts=Micropost.all
    @micropost=Micropost.new
  end
  def show
     @micropost = Micropost.find(params[:id])
    @comment = Comment.new
    @comments = @micropost.comments
    @like = Like.new
  end
  def edit
    @micropost = Micropost.find(params[:id])
  end
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
     @micropost = Micropost.find(params[:id])
     @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @microosts = Micropost.search(params[:search])
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :img)
    end
    
end
