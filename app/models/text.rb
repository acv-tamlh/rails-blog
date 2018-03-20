class Text < ApplicationRecord
  validates :headline, presence: true

  belongs_to :article
end
