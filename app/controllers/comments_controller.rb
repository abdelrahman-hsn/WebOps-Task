# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :authorize_request, except: %i[index show]
  before_action :verfiy_access, only: %i[update destroy]

  # GET /comments
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    render json: @comments
  end

  # comment /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = @current_user.id
    if @comment.save
      render json: @comment, status: :created
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

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:comment, :posts_id, :user_id)
  end

  def verfiy_access
    if @current_user.id == @comment.user_id
      return true
    else
      render json: 'unauthorized -_-', status: :unauthorized
    end
  end
end
