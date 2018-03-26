FactoryBot.define do
  factory :text do
    headline 'title text'
    order '2'
    sentence 'sentence'
    article_id { create(:article).id }
  end
end
