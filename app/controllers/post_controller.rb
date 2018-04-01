class PostController < ApplicationController

  def index
    @posts = Post.all
  end

  def post
    count = Post.count
    @post = Post.find(rand(1..count))
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
    post.user_name = current_user.name
    post.total = 0

    uploader1 = ImageUploader.new
    uploader1.store!(params[:pic1])

    uploader2 = ImageUploader.new
    uploader2.store!(params[:pic2])

    post.a_url = uploader1.url
    post.b_url = uploader2.url

    post.save

    redirect_to '/post'

  end

  def like
    l = Like.new
    l.user = current_user
    l.post = Post.find(params[:post_id])
    l.save
    redirect_to "/post"
  end

  def unlike
    l = Like.where(:post_id => params[:post_id]).where(:user_id => current_user).take
    l.delete
    redirect_to "/post"
  end

###################################

  def black
    p = Post.find(params[:post_id])
    p.a = p.a + 1
    p.total = p.total + 1
    p.save

    c = Check.new
    c.user = current_user
    c.post_id = params[:post_id]
    c.save
    redirect_to '/post'
  end

  def white
    p = Post.find(params[:post_id])
    p.b = p.b + 1
    p.total = p.total + 1
    p.save

    c = Check.new
    c.user = current_user
    c.post_id = params[:post_id]
    c.save
    redirect_to '/post'
  end

end
