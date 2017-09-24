class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def public_index
    @articles = Article.all
  end

  def public_show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Nuevo Articulo '#{@article.title}' Guardado!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    flash.notice = "Articulo '#{@article.title}' Actualizado!"
    redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end


end
