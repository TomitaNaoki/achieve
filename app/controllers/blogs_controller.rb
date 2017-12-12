class BlogsController < ApplicationController
 before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all    
    #binding.pry
    #raise
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  
  def edit
    set_blog
  end

  def show
      set_blog
  end

  def update
    set_blog
    if @blog.update(blog_params)
        redirect_to blogs_path, notice: 'ブログを編集しました'
    else
      render 'edit'
    end
  end
  
  def new
    @blog = Blog.new
  end
  
  def confirm
    @blog = Blog.new(blog_params)
  end
  
  def create
      #Blog.create(title: params[:blog][:title], content: params[:blog][:content])
      # 追記する
      @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to blogs_path, notice: 'ブログを作成しました！'
      else
        render 'new'
      end
  end


  private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end
  
end
