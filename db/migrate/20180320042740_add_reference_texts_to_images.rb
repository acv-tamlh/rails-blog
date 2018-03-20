class AddReferenceTextsToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :texts, index: true
    add_reference :texts, :images, index: true
  end
end
