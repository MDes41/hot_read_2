class Api::V1::ReadsController < ApplicationController
  def index
    @reads = Read.hot
    # response.headers["Access-Control-Allow-Origin"] = '*'
    render json: @reads
  end
end