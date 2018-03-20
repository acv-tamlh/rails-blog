# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all
articles = [
  {title: 'From today\'s featured article'},
  {title: 'Did you know...'},
  {title: 'From today\'s featured list'},
  {title: 'Today\'s featured picture'}
]

articles.each do |ar|
  Article.create(ar)
end
