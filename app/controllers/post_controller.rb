class PostController < ApplicationController

  def index
    @posts = Post.all
  end

  def post
  end

  def new
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

  def postlike
    l = Like.new
    l.user = current_user
    l.vpost_id = params[:post_id]
    l.save
    redirect_to "/post"
  end

  def postunlike
    l = Like.where(:vpost_id => params[:post_id]).where(:user => current_user).take
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

  private
    def post_params
      params.require(:post).permit(:title, :content, :img1, :img2, :crop_x, :crop_y, :crop_w, :crop_h)
    end

end
