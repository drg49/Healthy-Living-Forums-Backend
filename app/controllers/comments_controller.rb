class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1 (The postID for that specific post the comment is being commented on)
  def show
    render json: @comments
  end

  def postcomments
    comments = Comment.where(postid: params[:id]) #Get comments where the post ID = 4
    render json: comments
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = @user
    username = User.find(@user.id)
    @comment.author = username.username

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :postid, :author, :body)
    end
end
