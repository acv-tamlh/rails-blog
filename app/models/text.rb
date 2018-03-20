class Text < ApplicationRecord
  validates :headline, presence: true

  belongs_to :article
  has_many :images
end
