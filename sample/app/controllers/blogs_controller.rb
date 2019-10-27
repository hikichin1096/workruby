#アクションの役割

class BlogsController < ApplicationController

  #メソッドをアクションが実行される前に、実行
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    #テーブルからすべてのブログを取得
    @blogs = Blog.all

  end

  def show
    #特定のブログの詳細画面を表示するアクション
    #属性がidのみのため、StrongParametersは使用する必要はなし
    #データを渡すためにインスタンス変数に代入
    @blog = Blog.find(params[:id])

  end


  def new
    @blog = Blog.new #ビューにデータを渡す(インスタンス変数を定義する)
  end

  def create
    #Blog.create(title: params[:blog][:title], content: params[:blog][:content]) #モデルにDBの操作命令を出す(一つづつ記述する例)
    #Blog.create(params[:blog]) #マスアサインメント（カラムごとに記載しない方法）　米セキュリティ的に問題あり

    #Blog.create(params.require(:blog).permit(:title, :content)) #ストロングパラメーター

    @blog = Blog.create(blog_params)
    # create 関数呼び出し

    if @blog.save
      redirect_to new_blog_path,noties:"ブログを作成しました!" #リダイレクトを行う
    else
      # 入力フォーム再描画
      # 処理終了後に呼び出されるビューがnew.html.erbに変更される
      render :new

    end
  end


  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      #redirectメソッドでindexアクションにリダイレクト
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      #updateメソッドの実行に失敗した場合はeditアクションをrenderするようにします
      render :edit
    end
  end

  def destroy
    @blog.destroy
  end

  private #予期せぬところから呼び出さないように宣言（＝他クラスからの呼び出し不可）

  def blog_params
    params.require(:blog).permit(:title, :content)
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  # idをキーとして値を取得するメソッドを追加
  def set_blog
    @blog = Blog.find(params[:id])
  end

end
