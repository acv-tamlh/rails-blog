class Image < ApplicationRecord
  validates :headline, presence: true #,:url_image, 
  mount_uploader :url_image, ImageUploader
  belongs_to :article

end
