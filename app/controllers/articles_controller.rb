class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      # delete(" ")で文字列から全ての空白を削除する
      # split(",")で受け取った文字列をカンマ（,）区切りで配列にする
      tag_list = tag_params[:tag_names].split(/[[:blank:]]+/).select(&:present?)

      # Article.rb に save_tags()メソッドを定義
      @article.save_tags(tag_list)
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :content)
    end

    # タグ用にストロングパラメータを設定して、文字列を受け取る
    def tag_params
      params.require(:article).permit(:tag_names)
    end
end
