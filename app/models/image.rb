class Image < ApplicationRecord
  mount_uploader :url_image, ImageUploader
end
