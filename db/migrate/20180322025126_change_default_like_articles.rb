class ChangeDefaultLikeArticles < ActiveRecord::Migration[5.1]
  def change
    change_table :articles do |t|
      t.change_default(:like, 0)
    end
  end
end
