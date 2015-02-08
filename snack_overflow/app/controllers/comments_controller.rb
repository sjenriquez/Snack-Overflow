class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comments.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to :back
    else
      @errors = @comment.errors.messages
      redirect_to :back
    end
  end

  def update
    if @comment.update(comment_params)
       redirect_to :back
    else
      @errors = @comment.errors.messages
      redirect_to :back
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote(session[:user_id])
    redirect_to :back
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote(session[:user_id])
    redirect_to :back
  end

  private

  def set_user
    params[:comment][:user_id] = session[:user_id]
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    set_user
    params.require(:comment).permit(:body, :nom_id, :parent_id, :user_id)
  end
end
