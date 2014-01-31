class PostsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def index
    @post = Post.all
  end
  
  ## create the create function
  # enters blog post data into the database
  def create
    @post = Post.new(params[:post].permit(:title,:text))
    if @post.save
      redirect_to post_url(@post)
    else
      render 'new'
    end
  end
  
  ## function for updating an updated post
  def update
    @post = Post.find(params[:id]) 
    if @post.update(params[:post].permit(:title,:text))
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  ## destroys the selected post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to_posts_path
  end
  
  ## function to show the selected post
  def show
    @post = Post.find(params[:id])
  end
  
  ## function to print all posts out on page
  def index
    @post = Post.all
  end
  
  private
  ## define which parameters the create function will accept
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
