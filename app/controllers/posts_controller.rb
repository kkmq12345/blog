class PostsController < ApplicationController
	def index
		if params[:q].present?
      @search = params[:q]
      @posts = Post.where("title LIKE ? OR body LIKE ?", "%#{@search}%", "%#{@search}%")
    else
      @posts = Post.order(created_at: :desc)
    end
	end

	def new
		@post = Post.new
	end

	def create
    @post = Post.new post_params

    if @post.save
      redirect_to posts_path, flash: {success: "Post successfully created!"}
    else
      flash[:error] = "Please fill in all the required fields!"
      render :new
    end
	
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update post_params
      redirect_to posts_path, flash: {success: "Post edited!"}
    else
      flash[:error] = "Please fill in all the required fields!"
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    if @post.destroy
      redirect_to posts_path, flash: {success: "Post removed from list!"}
    else
      redirect_to posts_path
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end