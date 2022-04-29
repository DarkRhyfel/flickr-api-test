# frozen_string_literal: true

# Flickr photos controller
class PhotosController < ApplicationController
  def index; end

  def search
    puts ENV['FLICKR_API_KEY']
    flickr_api = Flickr.new ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET']

    photos = flickr_api.photos.search user_id: params[:user_id]
    @user_photos = photos.map { |photo| "https://live.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg" }

    render :index
  end
end
