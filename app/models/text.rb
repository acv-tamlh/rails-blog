class Text < ApplicationRecord
  validates :headline, presence: true

  belongs_to :article
  has_and_belongs_to_many :images
end
