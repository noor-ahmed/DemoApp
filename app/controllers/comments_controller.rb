class CommentsController < ApplicationController
  
  
  
  def create
    @comment = current_user.comments.create({body: params[:comment][:body], micropost_id: params[:micropost_id]})
    if @comment.save
      flash[:success] = "Your Comment is Posted"
      micropost = Micropost.find(params[:micropost_id])
      redirect_to micropost
    else
      flash[:danger] = "You Should Follow the user"
      render 'new'
    end
  end
  
  def new
   @comment	=	Comment.new
   @micropost_id = params[:micropost_id]
  end
  
  
  
  private
  
   def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end
