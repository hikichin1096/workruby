class TwiclonesController < ApplicationController

  before_action :set_twiclone,only:[:show, :edit, :update, :destroy]

  def index
    @twiclones = Twiclone.all
  end

  def new
    @twiclone = Twiclone.new
  end

  def create
    @twiclone = Twiclone.create(twiclone_params)

    if params[:back]
      render :new
    else
      if @twiclone.save
        #リダイレクト
        redirect_to new_twiclone_path, notice: "ツイート完了！"
      else
        #入力フォーム再描画
        render :new
      end
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @twiclone.destroy
    redirect_to twiclones_path, notice:"ツイート削除完了"
  end

  def update
    if @twiclone.update(twiclone_params)
      redirect_to twiclone_path, notice:"ツイート編集完了"
    else
      render:edit
    end
  end

  def comfirm
    @twiclone = Twiclone.new(twiclone_params)
    render :new if @twiclone.invalid?
  end


  private

  def twiclone_params
    params.require(:twiclone).permit(:content)
  end

  def set_twiclone
    @twiclone = Twiclone.find(params[:id])
  end

end
