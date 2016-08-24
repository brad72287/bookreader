class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to :back, notice: 'Comment was successfully created.'
      else
        redirect_to :back, alert: 'Your comment failed for some reason.'
      end
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
