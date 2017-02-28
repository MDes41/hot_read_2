class ReadsController < ApplicationController
  def index
    @hot_links = Read.hot
  end

  def create
    json = JSON.parse(url_params[:link])
    read = Read.find_or_create_by(url: json['url'])
    HandleRead.add_or_subtract(json, read)
  end

  private
    def url_params
      params.permit(:link)
    end
end