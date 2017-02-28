class Api::V1::ReadsController < ApplicationController
  def index
    @reads = Read.hot
    render json: @reads
  end
end