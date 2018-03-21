class AddFieldLikeToTexts < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :like, :integer
  end
end
