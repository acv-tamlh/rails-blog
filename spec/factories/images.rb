FactoryBot.define do
  factory :image do
    headline 'image headline'
    order '2'
    url_image 'https://www.google.com.vn/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png'
    article_id { create(:article).id }
    like '3'
  end
end
