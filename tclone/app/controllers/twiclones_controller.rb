class TwiclonesController < ApplicationController

  def index
  end

  def new
    @twiclone = Twiclone.new
  end

  def create
    Twiclone.create(twiclone_params)
    redirect_to new_twiclone_path #リダイレクトを行う
  end

  private

  def twiclone_params
    params.require(:twiclone).permit(:content)
  end

end
