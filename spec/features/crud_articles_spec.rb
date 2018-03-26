require 'rails_helper'

describe 'CRUD article', type: :feature do
  let!(:article) { create(:article) }
  context 'create product' do
    it 'good params' do
      visit 'articles/'
      first(:link, 'Create Article').click
      expect(page).to have_content 'New Article'
      fill_in 'Title', with: 'hello article'
      # fill_in 'Year', with: '2018'
      # fill_in 'Date', with: '12'
      # fill_in 'Month', with: 'October'
      click_on 'submit'
      expect(page).to have_content 'Create sucessfully'
    end
    it 'bad params' do
      visit 'articles/'
      first(:link, 'Create Article').click
      expect(page).to have_content 'New Article'
      fill_in 'Title', with: ''
      expect(page).to have_selector('p.alert.text-danger', 'Error in form')
    end
  end
  context 'read article' do
    it 'good params' do
      visit 'articles/'
      find(:link, article.title).click
      expect(page).to have_content article.title
      expect(page).to have_content article.try(:posttime)
      expect(page).to have_content article.like
      # expect(page).to have_content article.texts do |text|
        # expect(page).to have_content text.headline
      end
    end
  context 'edit article' do
    it 'good params' do
      visit 'articles/'
      first(:link, 'edit').click
      expect(page).to have_content 'Edit Article'
      fill_in 'Title', with: 'Edit'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Update sucessfully')
    end
    it 'bad params' do
      visit 'articles/'
      first(:link, 'edit').click
      expect(page).to have_content 'Edit Article'
      fill_in 'Title', with: ''
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Update fail')
    end
  end
  context 'delete article' do
    it 'good params' do
      visit 'articles'
      first(:link, 'delete').click
      expect(page).to have_selector('p.notice.text-success', 'Delete sucessfully')
    end
  end
end
