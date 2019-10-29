class TwiclonesController < ApplicationController

  def index
    @twiclones = Twiclone.all
  end

  def new
    @twiclones = Twiclone.new
  end

  def create
    Twiclone.create(twiclone_params)
    redirect_to new_twiclone_path #リダイレクトを行う
  end

  def show
    @twiclone = Twiclone.find(params[:id])
  end

  private

  def twiclone_params
    params.require(:twiclone).permit(:content)
  end

end
