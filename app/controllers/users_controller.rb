class UsersController < ApplicationController
  def index
    #@users=User.all
    
    @users = User.all.paginate(page: params[:page]).search(params[:search])
    
  end
  
  def show
    @user=User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page],:per_page => 5).search(params[:search])
  end
  
  def new
  end
  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end  
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
end
