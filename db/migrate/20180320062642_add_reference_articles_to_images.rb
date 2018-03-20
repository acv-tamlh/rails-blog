class AddReferenceArticlesToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :article, index: true
  end
end
