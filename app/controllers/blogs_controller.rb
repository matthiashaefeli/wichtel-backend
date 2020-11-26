class BlogsController < ApplicationController
  def home
    blog = Blog.order(id: :desc).as_json
    render json: blog
  end

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update_attributes(blog_params)
    redirect_to blogs_path
  end

  def destroy
    Blog.find(params[:id]).delete
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
