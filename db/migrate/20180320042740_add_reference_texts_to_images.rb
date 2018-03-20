class AddReferenceTextsToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :articles, index: true
    add_reference :articles, :images, index: true
  end
end
