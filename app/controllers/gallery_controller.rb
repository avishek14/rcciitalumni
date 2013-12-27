class GalleryController < ApplicationController
  def gallery
  	@gal_all = GalleryImages.all

  	set_title 'Gallery'
  end

  def one_image
  	@gal_one = GalleryImages.find params[:id]

  	set_title 'Gallery'
  end
end
