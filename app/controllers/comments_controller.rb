class CommentsController < ApplicationController
  before_action :verify_user, only: [:create]

  def create
    @product = Product.find_by id: params[:product_id]
    @comment = @product.comments.new comment_params
    @comment.user = current_user
    if @comment.save!
      respond_to do |format|
        format.html {redirect_to @product}
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end
end
