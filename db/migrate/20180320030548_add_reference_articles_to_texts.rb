class AddReferenceArticlesToTexts < ActiveRecord::Migration[5.1]
  def change
    add_reference :texts, :article, index: true
  end
end
