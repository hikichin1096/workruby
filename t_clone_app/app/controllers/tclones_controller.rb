class TclonesController < ApplicationController

  def index
  end

  def new
    @Tweet = Tweet.new
  end

  def create
    @Tweet = Tweet.create(content: params[:tweet][:content])
  end

end
