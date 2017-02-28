class ReadsController < ApplicationController
  def index
    @hot_links = Read.hot
  end

  def create
    read = Read.find_or_create_by(url: url_params[:url])
    read.count += 1
    read.save
  end

  private
  def url_params
    params.permit(:url)
  end
end