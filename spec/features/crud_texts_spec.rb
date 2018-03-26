require 'rails_helper'

describe 'CRUD text', type: :feature do
  let!(:text) { create(:text) }
  context 'create text' do
    it 'good params' do
      visit 'articles/'
      find(:link, Text.last.article.title).click
      expect(page).to have_content text.headline
      find(:link, 'Add text').click
      expect(page).to have_content 'New text'
      fill_in 'Headline', with: 'Headline'
      fill_in 'Order', with: '3'
      fill_in 'Sentence', with: 'Sentence'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Create sucessfully')
    end
    it 'bad params' do
      visit 'articles/'
      find(:link, Text.last.article.title).click
      expect(page).to have_content text.headline
      find(:link, 'Add text').click
      expect(page).to have_content 'New text'
      fill_in 'Headline', with: ''
      fill_in 'Order', with: '123a'
      fill_in 'Sentence', with: 'Sentence'
      click_on 'submit'
      expect(page).to have_selector('p.alert.text-danger', 'Create text error')
    end
  end
  context 'read text' do
    it 'good params' do
      visit 'articles/'
      find(:link, Text.last.article.title).click
      expect(page).to have_content text.headline
      expect(page).to have_content text.like
      expect(page).to have_content text.sentence
    end
  end
  context 'update text' do
    it 'good params' do
      visit 'articles/'
      find(:link, Text.last.article.title).click
      expect(page).to have_content text.headline
      first('.text').click_link('edit')
      expect(page).to have_content 'Edit text'
      fill_in 'Headline', with: 'Headline'
      fill_in 'Order', with: '3'
      fill_in 'Sentence', with: 'Sentence'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Create sucessfully')
    end
    it 'bad params headline' do
      visit 'articles/'
      find(:link, Text.last.article.title).click
      expect(page).to have_content text.headline
      first('.text').click_link('edit')
      expect(page).to have_content 'Edit text'
      fill_in 'Headline', with: ''
      fill_in 'Order', with: '3'
      fill_in 'Sentence', with: 'Sentence'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Create sucessfully')
    end
    it 'bad params order' do
      visit 'articles/'
      find(:link, Text.last.article.title).click
      expect(page).to have_content text.headline
      first('.text').click_link('edit')
      expect(page).to have_content 'Edit text'
      fill_in 'Headline', with: 'Headline'
      fill_in 'Order', with: 'asdas'
      fill_in 'Sentence', with: 'Sentence'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Create sucessfully')
    end
  end
  context 'delete text' do
    it 'good params' do
      visit 'articles/'
      find(:link, Text.last.article.title).click
      expect(page).to have_content text.headline
      first('.text').click_link('delete')
      expect(page).to have_selector('p.notice.text-success', 'Delete sucessfully')
    end
end
end
