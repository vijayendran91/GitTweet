class ArticlesController < ApplicationController
  
  def new
    @article=Article.new
  end

  def create
   # debugger
    @article=Article.new(article_params)
    @article.user=User.first
    
    @article.save
    if @article.save
      redirect_to article_path(@article)
      flash[:success]="article was successfully created"
    else
      render 'new'
    end
  end 

  private def article_params
    params.require(:article).permit(:title, :description)
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
    @articles=Article.all  
  end
  
  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash[:danger]="Article is deleted !"
  end

end
