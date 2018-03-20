class Article < ApplicationRecord
  validates :title, presence: true

  has_many :texts
  has_many :images

  scope :published, -> {where(['posttime <= ?', Time.now])}
end
