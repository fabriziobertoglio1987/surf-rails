require 'upload/cache'

class PostsController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [:landing]
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:create]
  before_action :set_picture, only: [:create]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def landing; end
  def edit; end
  def show; end

  def new; @post = Post.new; end

  def index
    @posts = Post.near([params[:latitude], params[:longitude]]) if request.format.json?
    # https://github.com/alexreisner/geocoder#geocoding-http-requests  
    # Post.near("#{request.location.city}, #{request.location.country}") 
    @posts = Post.all if request.format.html?
    @posts = @posts.newest.paginate(page: params[:page], per_page: params[:per_page])
  end

  def create
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render :new, alert: 'An error occurred and your post was not saved' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def liked
    params[:post][:liked]
  end

  def update
    @post.favorite.push(current_user.id) if liked == true
    @post.favorite.delete(current_user.id) if liked == false
    @post.favorite.uniq!

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private
  def set_picture
    cache = Upload::Cache.new(params[:post][:picture])
    @post.picture = PictureUploader.new
    @post.picture.store!(Upload::Image.new(cache))
  end

  def set_post
    @post = Post.new(post_params)
    @post.assign_attributes(
      user_id: current_user.id,
      ip_code: request.static_ip_finder
    )
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params   
    params.require(:post).permit(:description, :longitude, :latitude, :location, :likes, picture: {})
  end
end
