class MicropostsController < ApplicationController

  before_filter :authenticate
  before_filter :authorized_user, :only => [:destroy] 
  
  def create
    # the .build (instead of .new) creates the association 
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      redirect_to root_path, :flash => { :success => "Post created!" }
    else
    @feed_items = []
    render 'pages/home'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_to root_path, :flash => { :success => "Post deleted" }    
  end
  
  # This before filter prevents unauthorised users from deleting micro
  # -posts on a controller level
  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end

end