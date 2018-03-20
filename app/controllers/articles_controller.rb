class ArticlesController < ApplicationController

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(article_params)
    @article.username=params[:user_id]


    if @article.save
      redirect_to user_article_path(@article.username,@article.id)
      flash[:success]="article was successfully created"
    else
      render 'new'
    end
  end

  private def article_params
    params.require(:article).permit(:title, :description,:username)
  end

  def show
    @article=Article.find(params[:id])
  end

  def edit
    @article=Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
      flash[:success]="Article is updated successfully"
    else
      render 'edit'
    end
  end

  def index
    @user=User.find_by_username(params[:user_id])
    @article=(Article.where(username: @user.username))
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash[:danger]="Article is deleted !"
  end
  private
  def user_params
    params.require(:user).permit(:username,:fname,:lname,:email,:password,:password_confirmation,:dob)
  end
end
