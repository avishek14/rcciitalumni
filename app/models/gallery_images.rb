class GalleryImages < ActiveRecord::Base
	mount_uploader :gallery_image, GalleryUploader
end
