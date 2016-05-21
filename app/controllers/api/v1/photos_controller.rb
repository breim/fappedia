class Api::V1::PhotosController < ApplicationController
  before_action :set_params, only: [:index]


  # GET /api/v1/photos?category=nsfw?page=1
  def index
    @photos = HTTParty.get("https://imgur.com/r/#{params[:category]}/page/#{params[:page]}.json")
    render json: @photos
  end

  # GET /ap1/v1/photos/1?hash=an8fa0H.jpg
  def show
    @photo = "http://i.imgur.com/#{params[:hash]}#{params[:format]}".to_json
    render json: @photo
  end

  private
    def set_params
      params[:page] = 0 if params[:page].nil?
      params[:category] = 'AmateurArchives' if params[:category].nil?
    end

end