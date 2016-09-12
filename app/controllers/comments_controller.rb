class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
    render json: @comment, status: 201
      # if @comment.save
      #   redirect_to :back, notice: 'Comment was successfully created.'
      # else
      #   redirect_to :back, alert: "Sorry, your comment couldn't be added. Make sure it is at least 10 characters."
      # end
  end

  def destroy
    @comment.destroy
    redirect_to :back, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :book_id, :user_id)
    end
end
