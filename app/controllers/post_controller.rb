class PostController < ApplicationController

  def index
    @posts = Post.all
  end

  def post
  end

  def new
  end

  def view
    @posts = Post.all

  end

  def create
    post.title = params[:title]
    post.content = params[:content]
    post.a = 0
    post.b = 0
    post.user_name = ""
    post.total = 0

    uploader1 = ImageUploader.new
    uploader1.store!(params[:pic1])

    uploader2 = ImageUploader.new
    uploader2.store!(params[:pic2])

    post.a_url = uploader1.url
    post.b_url = uploader2.url

    post.save

    redirect_to '/post/new'

  end

  def like
    l = Like.new
    l.user = current_user
    l.post = Post.find(params[:post_id])
    l.save
    redirect_to "/post"
  end

  def unlike
    l = Like.where(id => params[:post_id]).where(:user_id => current_user).take
    l.delete
    redirect_to "/post"
  end

  def black
    p = Post.where(:post_id => id).take
    p.a = p.a + 1
    p.total = p.total + 1
  end

  def white
    p = Post.where(:post_id => params[:post_id]).take
    p.b = p.b + 1
    p,total = p.total + 1
  end

end
