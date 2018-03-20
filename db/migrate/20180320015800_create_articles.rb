class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :posttime

      t.timestamps
    end
  end
end
