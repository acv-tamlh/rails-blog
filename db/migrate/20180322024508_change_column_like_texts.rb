class ChangeColumnLikeTexts < ActiveRecord::Migration[5.1]
  def change
    change_table :texts do |t|
      t.change_default(:like, 0)
    end
  end
end
