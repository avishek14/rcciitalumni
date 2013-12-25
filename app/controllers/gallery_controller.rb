class GalleryController < ApplicationController
  def gallery
  	@gal_all = GalleryImages.all
  end

  def one_image
  	@gal_one = GalleryImages.find params[:id]
  end
end
