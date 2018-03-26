FactoryBot.define do
  factory :image do
    headline 'image headline'
    order '2'
    # url_image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/myfile.jpg')))
    article_id { create(:article).id }
    like '3'
  end
end
