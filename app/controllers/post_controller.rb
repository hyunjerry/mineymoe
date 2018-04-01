class PostController < ApplicationController

  def index
    @posts = Post.all
  end

  def post
  end

  def new
  end

  def view
    @thepost = Post.find(params[:post_id])
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
    l = Like.where(:post_id => params[:post_id]).where(:user_id => current_user).take
    l.delete
    redirect_to "/post"
  end

  def acount
    a = Acount.new
    a.user = current_user
    a.post_id = params[:post_id]
    a.save
    redirect_to "/post"
  end

  def bcount
    b = Bcount.new
    b.user = current_user
    b.post_id = params[:post_id]
    b.save
    redirect_to "/post"
  end

end
