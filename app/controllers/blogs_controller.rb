class BlogsController < ApplicationController
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

  def destroy
    Blog.find(params[:id]).delete
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
