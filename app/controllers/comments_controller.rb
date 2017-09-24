class CommentsController < ApplicationController

  def create
    if params[:name].blank?
      @user = User.last
      @comment = Comment.new(body: params[:comment][:body], imageable_id:@user.id, imageable_type:"User")
      @comment.article_id = params[:article_id]
      @comment.save
    else
      @visit = Visit.find_by_name(params[:name])
      if @visit.nil?
        @visit = Visit.create(name: params[:name], email: params[:email])
      else
        @visit.update_attributes(email: params[:email])
      end
      @comment = Comment.new(body: params[:comment][:body], imageable_id:@visit.id, imageable_type:"Visit")
      @comment.article_id = params[:article_id]
      @comment.save
    end
    redirect_to  public_show_article_path(@comment.article)
  end

  def create_answer
    if params[:name].blank?
      @user = User.last
      @comment = Comment.new(body: params[:comment][:body], imageable_id:@user.id, imageable_type:"User")
      @comment.article_id = params[:article_id]
      @comment.save
    else
      @visit = Visit.find_by_name(params[:name])
      if @visit.nil?
        @visit = Visit.create(name: params[:name], email: params[:email])
      else
        @visit.update_attributes(email: params[:email])
      end
      @comment_1 = Comment.find(params[:id])
      @comment = Comment.new(body: params[:comment][:body], imageable_id:@visit.id, imageable_type:"Visit", comment: @comment_1)
      @comment.article_id = params[:article_id]
      @comment.save
    end
    redirect_to  public_show_article_path(@comment.article)
  end

  def new_answer
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @new_answer = Comment.new
  end
end
