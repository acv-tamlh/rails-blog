class Image < ApplicationRecord
  validates :headline, presence: true
  mount_uploader :url_image, ImageUploader
  belongs_to :article

end
