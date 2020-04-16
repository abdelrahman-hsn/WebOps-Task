# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authorize_request, except: %i[index show]
  before_action :verfiy_access, only: %i[update destroy]

  # GET /posts
  def index
    @posts = Post.all
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.author_id = @current_user.id
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :body, :author_id, :tag_list)
  end

  def verfiy_access
    if @current_user.id == @post.author_id
      return true
    else
      render json: 'unauthorized -_-', status: :unauthorized
    end
  end
end
