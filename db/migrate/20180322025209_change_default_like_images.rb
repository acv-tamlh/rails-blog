class ChangeDefaultLikeImages < ActiveRecord::Migration[5.1]
  def change
    change_table :images do |t|
      t.change_default(:like, 0)
    end
  end
end
