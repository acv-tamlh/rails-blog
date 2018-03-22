class ChangeDefaultOrderTexts < ActiveRecord::Migration[5.1]
  def change
    change_table :texts do |t|
      t.change_default(:order, 0)
    end
  end
end
