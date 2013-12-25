class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :gallery_image
      t.string :caption
      t.text :desc

      t.timestamps
    end
  end
end
