class CommentsController < ApplicationController

  def create
    if !current_user.nil?
      @user = current_user
      @comment = Comment.create(body: params[:comment][:body], imageable_id:@user.id, imageable_type:"User", article_id: params[:article_id])
    else
      @visit = Visit.find_by_name(params[:name])
      if @visit.nil?
        @visit = Visit.create(name: params[:name], email: params[:email])
      else
        @visit.update_attributes(email: params[:email])
      end
      @comment = Comment.create(body: params[:comment][:body], imageable_id:@visit.id, imageable_type:"Visit", article_id: params[:article_id])
    end
    redirect_to  public_show_article_path(@comment.article)
  end

  def create_answer
    if !current_user.nil?
      @user = current_user
      @comment_1 = Comment.find(params[:id])
      @comment = Comment.create(body: params[:comment][:body], imageable_id:@user.id, imageable_type:"User", comment: @comment_1, article_id: params[:article_id])
    else
      @visit = Visit.find_by_name(params[:name])
      if @visit.nil?
        @visit = Visit.create(name: params[:name], email: params[:email])
      else
        @visit.update_attributes(email: params[:email])
      end
      @comment_1 = Comment.find(params[:id])
      @comment = Comment.create(body: params[:comment][:body], imageable_id:@visit.id, imageable_type:"Visit", comment: @comment_1, article_id: params[:article_id])
    end
    redirect_to  public_show_article_path(@comment.article)
  end

  def new_answer
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @new_answer = Comment.new
  end
end
