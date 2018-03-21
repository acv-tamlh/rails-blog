class AddFieldLikeToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :like, :integer
  end
end
