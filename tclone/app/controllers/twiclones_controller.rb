class TwiclonesController < ApplicationController

  def index
    @twiclones = Twiclone.all
  end

  def new
    @twiclones = Twiclone.new
  end

  def create
    @twiclone = Twiclone.create(twiclone_params)

    if @twiclone.save
      #リダイレクト
      redirect_to new_twiclone_path, notice: "ツイート完了！"
    else
      #入力フォーム再描画
      render :new
    end
  end

  def edit
    @twiclone = Twiclone.find(params[:id])
  end

  def show
    @twiclone = Twiclone.find(params[:id])
  end

  def update
    @twiclone = Twiclone.find(params[:id])
    redirect_to twiclone_path, notice:"ツイート編集完了"
  end

  private

  def twiclone_params
    params.require(:twiclone).permit(:content)
  end

end
