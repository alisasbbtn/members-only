class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "successfully posted \"#{@post.title}\"."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'please log in.'
      redirect_to login_path
    end
  end
end
