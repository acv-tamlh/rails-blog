class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :headline
      t.integer :order
      t.string :url_img
    end
  end
end
