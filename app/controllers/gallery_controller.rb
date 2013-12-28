class GalleryController < ApplicationController
  def gallery
  	@gal_all = GalleryImages.all.page(params[:page]).per(9)

  	set_title 'Gallery'
  end

  def one_image
  	@gal_one = GalleryImages.find params[:id]

  	set_title 'Gallery'
  end
end
